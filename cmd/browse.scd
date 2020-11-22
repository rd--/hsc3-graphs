(var db_dir = PathName.new("/home/rohan/sw/hsc3-graphs/db") // PathName
;var is_lisp_file = {arg fn; fn.extension == "lisp" || fn.extension == "scm"} // PathName -> Bool
;var is_sclang_file = {arg fn; fn.extension == "scd"} // PathName -> Bool
;var is_haskell_file = {arg fn; fn.extension == "hs"} // PathName -> Bool
;var is_forth_file = {arg fn; fn.extension == "fs"} // PathName -> Bool
;var is_synthdef_file = {arg fn; fn.extension == "scsyndef"} // PathName -> Bool
;var mk_synthdef_file_name = {arg z; (db_dir +/+ (z.asString ++ ".scsyndef")).fullPath} // Symbol -> PathName
;var mk_dot_file_name = {arg z; (db_dir +/+ "dot" +/+ (z.asString ++ ".dot")).fullPath} // Symbol -> PathName
;var load_scsyndef_file = // PathName -> Int8Array
 {arg fn
 ;var fd = File.open(fn,"rb")
 ;var sz = File.fileSize(fn)
 ;var ra = Int8Array.newClear(sz)
 ;var qr = fd.read(ra)
 ;fd.close
 ;ra}
;var filename_z = {arg fn; fn.fileNameWithoutExtension.asSymbol} // PathName -> Symbol
;var filename_z_text = {arg fn; [filename_z.value(fn),File.readAllString(fn.fullPath)]} // PathName -> (Symbol,String)
;var db_univ = db_dir.files().collect(filename_z).asSet.asArray.sort // [Symbol]
;var db_text_file_name_set = db_dir.files().reject({arg fn; is_synthdef_file.value(fn)}) // [PathName]
;var db_text_file_data = Dictionary.newFrom(db_text_file_name_set.collect(filename_z_text).flatten) // [(Symbol,String)]
;var z_load_syn = {arg z; [z,load_scsyndef_file.value(mk_synthdef_file_name.value(z))]} // Symbol -> (Symbol,Int8Array)
;var db_syn_file_data = Dictionary.newFrom(db_univ.collect(z_load_syn).flatten) // [(Symbol,Int8Array)]
;var cur_z = db_univ[0] // Symbol
;var w = Window.new(bounds: Rect.new(128, 64, 900, 600)).front // Window
;var t_search = TextField.new(w).font_(Font.monospace) // TextField
;var do_ugen_xmenu_core = {"hsc3-db xmenu core".unixCmdGetStdOut} // () -> String
;var do_ugen_xmenu_external = {"hsc3-db xmenu external".unixCmdGetStdOut} // () -> String
;var do_u_menu = // (() -> String) -> () -> ()
 {arg xmenu
 ;{var txt = xmenu.value
  ;t_search.string_((t_search.string + txt).stripWhiteSpace)
  ;t_search.doAction}}
;var b_ugen_menu_core = Button.new(w).font_(Font.monospace).maxWidth_(16).states_([["U",Color.black,Color.white]]).action_(do_u_menu.value(do_ugen_xmenu_core)) // Button
;var b_ugen_menu_external = Button.new(w).font_(Font.monospace).maxWidth_(16).states_([["X",Color.black,Color.white]]).action_(do_u_menu.value(do_ugen_xmenu_external)) // Button
;var txt_contains_all_terms = // String -> String -> Bool
 {arg txt, terms
 ;var in_txt = {arg x; txt.find(x,ignoreCase:true).notNil}
 ;terms.split($ ).every(in_txt)}
;var syn_to_entry_text = {arg x; x.asString + db_text_file_data[x].split($\n)[0]} // Symbol -> String
;var l_univ = ListView.new(w).font_(Font.monospace).items_(db_univ.collect(syn_to_entry_text)) // ListView
;var t_code = TextView.new(w).minHeight_(12 * 12).font_(Font.monospace) // TextView
;var do_play = {s.sendMsg("/s_new",cur_z,s.nextNodeID, 0, 1)} // () -> ()
;var do_stop = {CmdPeriod.run} // () -> ()
;var do_draw = {var cmd = "hsc3-dot scsyndef-draw" + mk_synthdef_file_name.value(cur_z); cmd.unixCmd} // () -> ()
;var do_get_stat = {arg z; ("hsc3-scsynth scsyndef stat" + mk_synthdef_file_name.value(z)).unixCmdGetStdOut} // Symbol -> String
;var do_stat = // () -> ()
 {var w = Window.new(resizable:false,bounds:Rect.new(128, 64, 900, 300)).front
 ;var t = TextView.new(w).font_(Font.monospace).string_(do_get_stat.value(cur_z))
 ;w.layout = VLayout.new(t)}
;var lookup_texture_param = // String -> String
 {arg str
 ;var res = str.findRegexp("texture=[.,a-z0-9]*")
 ;if(res == [],{"overlap,4,4,4,inf"},{res[0][1].drop(8)})}
;var do_texture_proc = // Symbol -> String -> ()
 {arg sy_name, tx_param
 ;var sy_filename = mk_synthdef_file_name.value(sy_name)
 ;var w = Window.new(bounds: Rect.new(120, 480, 500, 20),resizable:false).front
 ;var t_sy_name = StaticText.new(w).font_(Font.monospace).string_(sy_name)
 ;var t_tx_param = TextField.new(w).font_(Font.monospace).string_(tx_param)
 ;var p_proc = nil
 ;var proc_end = {"proc_end".postln; if(p_proc.isNil,{},{p_proc.putChar($q); p_proc.close; p_proc = nil})}
 ;var do_control = {arg x; var cmd = "hsc3-lang scsyndef-to-texture" + sy_filename + t_tx_param.string; if(x.value == 1,{p_proc=Pipe.new(cmd,"w")},proc_end)}
 ;var start_stop_st = [["Start",Color.black,Color.white],["Stop",Color.black,Color.white]]
 ;var b_control = Button.new(w).font_(Font.monospace).states_(start_stop_st).action_(do_control)
 ;w.layout_(HLayout.new(t_sy_name,t_tx_param,b_control)).onClose_(proc_end)}
;var do_texture = {do_texture_proc.value(cur_z,lookup_texture_param.value(db_text_file_data[cur_z]))} // () -> ()
;var do_univ_sel = // Int -> ()
 {arg i, e_
 ;cur_z = l_univ.items[i.value].split($ )[0].asSymbol
 ;t_code.string = db_text_file_data[cur_z]
 ;s.sendMsg("/d_recv",db_syn_file_data[cur_z])}
;var do_filter = // String -> ()
 {arg x
 ;var narrow = {db_text_file_data.select({arg txt; txt_contains_all_terms.value(txt,x.value)}).keys.asArray}
 ;var univ_sel = if(x.value.isEmpty,{db_univ},narrow)
 ;l_univ.items_(univ_sel.collect(syn_to_entry_text))
 ;do_univ_sel.value(0)}
;var l_univ_menu = // [MenuAction]
 [MenuAction.new("Play",do_play).shortcut_("Ctrl+P")
 ,MenuAction.new("Stop",do_stop).shortcut_("Ctrl+.")
 ,MenuAction.new("Draw",do_draw).shortcut_("Ctrl+D")
 ,MenuAction.new("Stat",do_stat).shortcut_("Ctrl+S")
 ,MenuAction.new("Texture",do_texture).shortcut_("Ctrl+T")]
;l_univ.action_(do_univ_sel)
;l_univ.setContextMenuActions(*l_univ_menu)
;w.layout = VLayout.new(HLayout.new(b_ugen_menu_core,b_ugen_menu_external,t_search),l_univ,t_code)
;t_search.action_(do_filter))

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
 read 'default' texture from comment texture=param
 param in plain text (ie. not in form)
 open window with scsyndef file & default param pre-filled
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
