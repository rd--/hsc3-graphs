// tw 0224 (f0) - http://www.fredrikolofsson.com/f0blog/?q=node/617
{var c = 200000
;var b = LocalBuf(c,2).clear
;var d = BufRd.ar(2,b,SinOsc.ar([2,3] * 9) * c,0)
;BufWr.ar(SinOsc.ar(3 / [2,3]) / 3,b,SinOsc.ar([99,145]).abs * c)
;d * 0.5}
