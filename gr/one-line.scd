{var lfs = LFSaw.ar([1,0.99],[0,0.6],2000,2000)
;var lfs_t = lfs.trunc([400,600]) * [1,-1]
;var f = OnePole.ar(Mix.new(lfs_t),0.98)
;Out.ar(0,Pan2.ar(SinOsc.ar(f,0),0,0.1))}.play
