// generating melodic runs, line ; https://github.com/cianoc/supercollider_fragments
{SinOsc.ar(Latch.kr(LFSaw.kr(Line.kr(0.1, 20, 60), 0, 500, 600), Impulse.kr(10)), mul: 0.1)}
