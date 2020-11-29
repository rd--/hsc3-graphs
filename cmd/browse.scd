// polygot graph browser on directory
PolyglotGraphBrowser.on(directoryName: "/home/rohan/sw/hsc3-graphs/db/")

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
;var m_type = PopUpMenu(w).items_(["Overlap","Spawn","XFade"])
;var do_start = {[m_type.value,n_sustain.value,n_transition.value,n_overlaps.value,n_nodes.value].postln}
;var b_start = Button(w).states_([["Start",Color.black,Color.white]]).action_(do_start)
;w.layout_(HLayout(m_type,n_sustain,n_transition,n_overlaps,n_nodes,b_start)))
