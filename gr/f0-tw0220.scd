// http://www.fredrikolofsson.com/f0blog/?q=node/617

{var c = InFeedback.ar(0,1)
;var b = LocalBuf(90000).clear
;var g = TGrains.ar(2,SinOsc.ar(3,0),b,c + 3,2,12)
;RecordBuf.ar(c,b)
;HPF.ar(SinOsc.ar(99,c * 6) / 9 + g,9)}.play
