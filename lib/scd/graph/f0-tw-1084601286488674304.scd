// https://twitter.com/redFrik/status/1084601286488a674304
{var b = #[2, 5, 1, 6, 3]
;var x = PitchShift.ar(LocalIn.ar(2, 0), 1.5, 0.5, 0, 0)
;var y = VarSaw.ar(LFSaw.ar(1 / b, 0) > 0 / 4 + 1.25 ** b * 99, 0, LFSaw.ar(b / 9, 0) % 1)
;var z = HPF.ar(LFSaw.ar(LFSaw.ar(1 / b, 0).round + 1/2, 0) > 0, LFSaw.ar(b / 33, 0) * 4 + 8)
;var d = MoogFF.ar(Splay.ar(y * z), LFSaw.ar(1/9, 0) + 2 * 4000, 2, 0)
;LocalOut.ar(d)
;d}

//---- https://twitter.com/redFrik/status/1084601286488a674304
{var b = [2,5,1,6,3]
;var x = ar(PitchShift,ar(LocalIn,2),1.5,0.5)
;var y = ar(VarSaw,ar(LFSaw,1/b)>0/4+1.25**b*99,0,ar(LFSaw,b/9)%1)
;var z = ar(HPF,ar(LFSaw,ar(LFSaw,1/b).round+1/2)>0,ar(LFSaw,b/33)*4+8)
;var d = ar(MoogFF,ar(Splay,y*z),ar(LFSaw,1/9)+2*4e3)
;ar(LocalOut,d)
;d}
