(var db_dir = PathName.new("/home/rohan/sw/hsc3-graphs/db")
;var is_lisp_file = {arg fn; fn.extension == "lisp" || fn.extension == "scm"}
;var is_sclang_file = {arg fn; fn.extension == "scd"}
;var is_haskell_file = {arg fn; fn.extension == "hs"}
;var is_forth_file = {arg fn; fn.extension == "fs"}
;var is_synthdef_file = {arg fn; fn.extension == "scsyndef"}
;var mk_synthdef_file_name = {arg z; (db_dir +/+ (z.asString ++ ".scsyndef")).fullPath}
;var mk_dot_file_name = {arg z; (db_dir +/+ "dot" +/+ (z.asString ++ ".dot")).fullPath}
;var load_scsyndef_file = {arg fn; var fd = File.open(fn,"rb"); var sz = File.fileSize(fn); var ra = Int8Array.newClear(sz) ; var qr = fd.read(ra); fd.close; ra}
;var db_univ = db_dir.files().collect({arg fn; fn.fileNameWithoutExtension.asSymbol}).asSet.asArray.sort // [Symbol]
;var db_text_file_name_set = db_dir.files().reject({arg fn; is_synthdef_file.(fn)}) // [Path]
;var db_text_file_data = Dictionary.newFrom(db_text_file_name_set.collect({arg fn; [fn.fileNameWithoutExtension.asSymbol,File.readAllString(fn.fullPath)]}).flatten) // [(Symbol,String)]
;var db_syn_file_data = Dictionary.newFrom(db_univ.collect({arg z; [z,load_scsyndef_file.(mk_synthdef_file_name.(z))]}).flatten) // [(Symbol,RawArray)]
;var cur_z = db_univ[0]
;var cur_syn = nil
;var w = Window(bounds: Rect(128, 64, 900, 600)).front
;var t_search = TextField(w).font_(Font.monospace)
;var do_ugen_xmenu = {"cat ~/sw/hsc3-db/lib/xmenu/ugen-core-tree.text ~/sw/hsc3-db/lib/xmenu/nil.text ~/sw/hsc3-db/lib/xmenu/ugen-ext-tree.text | xmenu".unixCmdGetStdOut}
;var b_ugen_menu = Button(w).font_(Font.monospace).maxWidth_(16).states_([["U",Color.black,Color.white]]).action_({var txt = do_ugen_xmenu.value; t_search.string_((t_search.string + txt).stripWhiteSpace); t_search.doAction})
;var txt_contains_all_terms = {arg txt, terms; terms.split($ ).every({arg x; txt.find(x,ignoreCase:true).notNil})}
;var syn_to_entry_text = {arg x; x.asString + db_text_file_data[x].split($\n)[0]}
;var l_univ = ListView(w).font_(Font.monospace).items_(db_univ.collect(syn_to_entry_text))
;var t_code = TextView(w).minHeight_(12 * 12).font_(Font.monospace)
;var do_play = {s.sendMsg("/s_new",cur_z,s.nextNodeID, 0, 1)}
;var do_stop = {CmdPeriod.run}
;var do_draw = {var cmd = "hsc3-dot scsyndef-draw" + mk_synthdef_file_name.(cur_z); cmd.unixCmd}
;var do_get_stat = {arg z; ("hsc3-scsynth scsyndef stat" + mk_synthdef_file_name.(z)).unixCmdGetStdOut}
;var do_stat = {var w = Window(resizable:false,bounds:Rect(128, 64, 900, 300)).front; var t = TextView(w).font_(Font.monospace).string_(do_get_stat.(cur_z)); w.layout = VLayout(t);}
;var lookup_texture_param = {arg str; var res = str.findRegexp("texture=[.,a-z0-9]*"); if(res == [],{"overlap,4,4,4,inf"},{res[0][1].drop(8)})}
;var do_texture_proc =
 {arg sy_name, tx_param
 ;var sy_filename = mk_synthdef_file_name.(sy_name)
 ;var w = Window(bounds: Rect(120, 480, 500, 20),resizable:false).front
 ;var t_sy_name = StaticText(w).font_(Font.monospace).string_(sy_name)
 ;var t_tx_param = TextField(w).font_(Font.monospace).string_(tx_param)
 ;var p_proc = nil
 ;var proc_end = {"proc_end".postln; if(p_proc.isNil,{},{p_proc.putChar($q); p_proc.close; p_proc = nil})}
 ;var do_control = {arg x; var cmd = "hsc3-lang scsyndef-to-texture" + sy_filename + t_tx_param.string; if(x.value == 1,{p_proc=Pipe.new(cmd,"w")},proc_end)}
 ;var b_control = Button(w).font_(Font.monospace).states_([["Start",Color.black,Color.white],["Stop",Color.black,Color.white]]).action_(do_control)
 ;w.layout_(HLayout(t_sy_name,t_tx_param,b_control)).onClose_(proc_end)}
;var do_texture = {do_texture_proc.(cur_z,lookup_texture_param.(db_text_file_data[cur_z]))}
;l_univ.action_({arg i, e; cur_z = l_univ.items[i.value].split($ )[0].asSymbol; t_code.string = db_text_file_data[cur_z]; s.sendMsg("/d_recv",db_syn_file_data[cur_z])})
;l_univ.setContextMenuActions(MenuAction("Play",do_play).shortcut_("Ctrl+P"),MenuAction("Stop",do_stop).shortcut_("Ctrl+."),MenuAction("Draw",do_draw).shortcut_("Ctrl+D"),MenuAction("Stat",do_stat).shortcut_("Ctrl+S"),MenuAction("Texture",do_texture).shortcut_("Ctrl+T"))
;w.layout = VLayout(HLayout(b_ugen_menu,t_search),l_univ,t_code)
;t_search.action_({arg x; var univ_sel = if(x.value.isEmpty,{db_univ},{db_text_file_data.select({arg txt; txt_contains_all_terms.(txt,x.value)}).keys.asArray}); l_univ.items_(univ_sel.collect(syn_to_entry_text))}))

/*

RGraph { name_sym:Symbol syn_fn:Path syn_data:Int8Array src_fn:Path src_text:String src_lang={hs,lisp,scm,fs,scd} }

RGraphDB { db_dir:Path db_graph_dict:Dict(Symbol,RGraph) }

- search graphdef also so SinOsc will find lisp graphs where the UGen is called sin-osc
- buffer loading
- wavetable assignment
- controller derivation

# buffer browser
 list of all known buffers, file selector to load buffer
 at Buffer: bufnum, numFrames, numChannels, sampleRate, path=names of file loaded
 + wavetable flag, associated b_gen message
 + plot

RBuffer { buf:Buffer is_wavetable:Bool gen_msg:OSC|nil } . plot

RBufferSet { buf_set:[RBuffer] } . browse

# menu to select ugen, category tree (ie. hsc3-db)
  (xmenu, dmenu, hsc3-db) for selecting UGens by category, w/ completion

# overlap-texture
 menu entry
 opens window (form) with scsyndef file pre-filled
 form collects: texture-type (enum: overlap xfade spawn) & arguments (different for each)
 "console" view gets stdout text (Pipe)
 closing window stops/kills process

*/

(var w = Window(bounds: Rect(128, 64, 500, 20),resizable:true).front
;var n_sustain = NumberBox(w).value_(4)
;var n_transition = NumberBox(w).value_(4)
;var n_overlaps = NumberBox(w).value_(2)
;var n_nodes = NumberBox(w).value_(10000)
;var m_type = PopUpMenu(w).items_(["Overlap","Spawn","XFade"]).font_(Font.monospace)
;var do_start = {[m_type.value,n_sustain.value,n_transition.value,n_overlaps.value,n_nodes.value].postln}
;var b_start = Button(w).font_(Font.monospace).states_([["Start",Color.black,Color.white]]).action_(do_start)
;w.layout_(HLayout(m_type,n_sustain,n_transition,n_overlaps,n_nodes,b_start)))
