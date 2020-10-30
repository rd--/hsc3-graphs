(var db_dir = PathName.new("/home/rohan/sw/hsc3-graphs/db")
;var is_lisp_file = {arg fn; fn.extension == "lisp" || fn.extension == "scm"}
;var is_sclang_file = {arg fn; fn.extension == "scd"}
;var is_haskell_file = {arg fn; fn.extension == "hs"}
;var is_forth_file = {arg fn; fn.extension == "fs"}
;var is_synthdef_file = {arg fn; fn.extension == "scsyndef"}
;var db_file_names = db_dir.files()
;var db_text_file_names = db_file_names.reject({arg fn; is_synthdef_file.(fn)})
;var db_text_file_data = db_text_file_names.collect({arg fn; File.readAllString(fn.fullPath)})
;var w = Window.new.front
;var v = ListView(w).items_(db_text_file_names.collect({arg fn; fn.fileName.asString}))
;var t = TextField(w).minHeight_(400)
;v.action_({arg i; t.string = db_text_file_data[i.value]})
;w.layout = VLayout(v,t)
;1)
