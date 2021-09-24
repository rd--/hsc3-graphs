// sample and hold ; https://github.com/cianoc/supercollider_fragments
{var i = Latch.kr(LFSaw.kr(MouseX.kr(1.1, 30), 0, 5, 5), Impulse.kr(10))
;PMOsc.ar(300, 356, i, mul: 0.1)}
