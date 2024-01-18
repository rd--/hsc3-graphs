// f0 ; tw 0164
var cm = CombN.ar(InFeedback.ar(#[1, 0], 1), 5, #[4.8, 4.7], 1);
var fr = Pitch.kr(cm, 440, 60, 4000, 100, 16, 1, 0.01, 0.5, 1, 0).flop[0] - 4;
var ph = SinOsc.ar(fr, 0) * 2 * pi * SinOsc.ar(1 / 16, 0);
var o = SinOsc.ar([1, 2], ph);
LeakDC.ar(o, 0.995) / 2 / 2

//---- f0 ; tw 0164
a=SinOsc;LeakDC.ar(a.ar([1,2],a.ar(Pitch.kr(CombN.ar(InFeedback.ar([1,0]),5,[4.8,4.7])).flop[0]-4)*2pi*a.ar(1/16)))/2
