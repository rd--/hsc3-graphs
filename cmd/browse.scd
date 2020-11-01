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
;var w = Window.new.front
;var t_search = TextField(w).font_(Font.monospace)
;var l_univ = ListView(w).font_(Font.monospace).items_(db_univ)
;var t_code = TextView(w).minHeight_(12 * 12).font_(Font.monospace)
;var t_stat = TextView(w).minHeight_(12 * 12).font_(Font.monospace)
;var do_play = {s.sendMsg("/s_new",cur_z,s.nextNodeID, 0, 1)}
;var do_stop = {CmdPeriod.run}
;var do_draw = {var cmd = "hsc3-dot scsyndef-draw " ++ mk_synthdef_file_name.(cur_z); cmd.unixCmd}
;var v_play = Button(w).font_(Font.monospace).states_([["PLAY", Color.black, Color.white]]).action_(do_play)
;var v_stop = Button(w).font_(Font.monospace).states_([["STOP", Color.black, Color.white]]).action_(do_stop)
;var v_draw = Button(w).font_(Font.monospace).states_([["DRAW", Color.black, Color.white]]).action_(do_draw)
;l_univ.action_({arg i, e; cur_z = l_univ.items[i.value]; t_code.string = db_text_file_data[cur_z]; t_stat.string = ("hsc3-scsynth scsyndef stat " ++ mk_synthdef_file_name.(cur_z)).unixCmdGetStdOut; s.sendMsg("/d_recv",db_syn_file_data[cur_z])})
;l_univ.setContextMenuActions(MenuAction("PLAY",do_play).shortcut_("Ctrl+P"),MenuAction("STOP",do_stop).shortcut_("Ctrl+."),MenuAction("DRAW",do_draw).shortcut_("Ctrl+D"))
;w.layout = VLayout(t_search,l_univ,t_code,t_stat,HLayout(v_play,v_stop,v_draw))
;t_search.action_({arg x; var univ_sel = if(x.value.isEmpty,{db_univ},{db_text_file_data.select({arg txt; txt.find(x.value,ignoreCase:true).notNil})}); l_univ.items_(univ_sel.keys.asArray)})
)

/*

RGraph { name_sym:Symbol syn_fn:Path syn_data:Int8Array src_fn:Path src_text:String src_lang={hs,lisp,scm,fs,scd} }

RGraphDB { db_dir:Path db_graph_dict:Dict(Symbol,RGraph) }

- l_univ: display prefix of code
- t_stat: truncate lines (no-wrap)
- buffer loading
- wavetable assignment
- controller derivation

*/
