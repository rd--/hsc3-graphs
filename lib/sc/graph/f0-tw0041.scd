// http://www.fredrikolofsson.com/f0blog/?q=node/537
{var s = Sweep.ar(LocalIn.ar(6))
;var i = Impulse.ar([1,0.749,6,12,3,4])
;var o = SinOsc.ar(1 / RunningMax.ar(s,i))
;LocalOut.ar(o)
;Splay.ar(o).tanh / 2 * 0.1}.play
