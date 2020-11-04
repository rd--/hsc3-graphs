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
;l_univ.action_({arg i, e; cur_z = l_univ.items[i.value].split($ )[0].asSymbol; t_code.string = db_text_file_data[cur_z]; s.sendMsg("/d_recv",db_syn_file_data[cur_z])})
;l_univ.setContextMenuActions(MenuAction("Play",do_play).shortcut_("Ctrl+P"),MenuAction("Stop",do_stop).shortcut_("Ctrl+."),MenuAction("Draw",do_draw).shortcut_("Ctrl+D"),MenuAction("Stat",do_stat).shortcut_("Ctrl+S"))
;w.layout = VLayout(HLayout(b_ugen_menu,t_search),l_univ,t_code)
;t_search.action_({arg x; var univ_sel = if(x.value.isEmpty,{db_univ},{db_text_file_data.select({arg txt; txt_contains_all_terms.(txt,x.value)}).keys.asArray}); l_univ.items_(univ_sel.collect(syn_to_entry_text))})
)

/*

RGraph { name_sym:Symbol syn_fn:Path syn_data:Int8Array src_fn:Path src_text:String src_lang={hs,lisp,scm,fs,scd} }

RGraphDB { db_dir:Path db_graph_dict:Dict(Symbol,RGraph) }

- menu (xmenu, hsc3-db) for selecting UGens by category
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

# overlap-texture
 menu entry
 opens window (form) with scsyndef file pre-filled
 form collects: texture-type (enum: overlap xfade spawn) & arguments (different for each)
 "console" view gets stdout text (Pipe)
 closing window stops/kills process

*/
