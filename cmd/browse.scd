(var db_dir = PathName.new("/home/rohan/sw/hsc3-graphs/db")
;var is_lisp_file = {arg fn; fn.extension == "lisp" || fn.extension == "scm"}
;var is_sclang_file = {arg fn; fn.extension == "scd"}
;var is_haskell_file = {arg fn; fn.extension == "hs"}
;var is_forth_file = {arg fn; fn.extension == "fs"}
;var is_synthdef_file = {arg fn; fn.extension == "scsyndef"}
;var mk_synthdef_file_name = {arg z; (db_dir +/+ (z.asString ++ ".scsyndef")).fullPath}
;var mk_dot_file_name = {arg z; (db_dir +/+ "dot" +/+ (z.asString ++ ".dot")).fullPath}
;var load_scsyndef_file = {arg fn; var fd = File.open(fn,"rb"); var sz = File.fileSize(fn); var ra = RawArray.new(sz) ; [fn,sz].postln; fd.read(ra); fd.close; ra}
;var db_univ = db_dir.files().collect({arg fn; fn.fileNameWithoutExtension.asSymbol}).asSet.asArray.sort // [Symbol]
;var db_text_file_name_set = db_dir.files().reject({arg fn; is_synthdef_file.(fn)}) // [Path]
;var db_text_file_data = Dictionary.newFrom(db_text_file_name_set.collect({arg fn; [fn.fileNameWithoutExtension.asSymbol,File.readAllString(fn.fullPath)]}).flatten) // [(Symbol,String)]
;var db_syn_file_data = Dictionary.newFrom(db_univ.collect({arg z; mk_synthdef_file_name.(z).postln; [z,load_scsyndef_file.(mk_synthdef_file_name.(z))]})) // [(Symbol,RawArray)]
;var cur_z = db_univ[0]
;var cur_syn = nil
;var w = Window.new.front
;var t_search = TextField(w).font_(Font("monospace"))
;var l_univ = ListView(w).font_(Font("monospace")).items_(db_univ)
;var t_code = TextView(w).minHeight_(12 * 12).font_(Font("monospace"))
;var v_play = Button(w).font_(Font("monospace")).states_([["PLAY", Color.black, Color.white]]).action_({cur_z.postln; cur_syn = Synth(cur_z)})
;var v_stop = Button(w).font_(Font("monospace")).states_([["STOP", Color.black, Color.white]]).action_({CmdPeriod.run})
;var v_draw = Button(w).font_(Font("monospace")).states_([["DRAW", Color.black, Color.white]]).action_({var cmd = "dot -Txlib " ++ mk_dot_file_name.(cur_z); cmd.postln; cmd.unixCmd})
;l_univ.action_({arg i, e; cur_z = l_univ.items[i.value]; t_code.string = db_text_file_data[cur_z]})
;w.layout = VLayout(t_search,l_univ,t_code,HLayout(v_play,v_stop,v_draw))
;db_univ.do({arg z; z.postln; SynthDescLib.global.read(mk_synthdef_file_name.(z)); SynthDescLib.global.at(z).def.send})
;t_search.action_({arg x; var univ_sel = if(x.value.isEmpty,{db_univ},{db_text_file_data.select({arg txt; txt.find(x.value,ignoreCase:true).notNil})}); l_univ.items_(univ_sel.keys.asArray)})
)



/*
- scsynth synthdef limit (reset locally?)
- send only as required (ie. PLAY - requires delay/sync...)
- use d_recv and s_new directly
- graph drawing
- buffer loading
- wavetable assignment
- controller derivation
*/
