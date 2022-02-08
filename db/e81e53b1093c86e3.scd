// generating melodic runs ; https://github.com/cianoc/supercollider_fragments
SinOsc.ar(Latch.kr(LFSaw.kr(MouseX.kr(0.1, 20), 0, 500, 600), Impulse.kr(10)), mul: 0.1)
