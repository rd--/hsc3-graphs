// sweep verb ; jmcc #5
var s = AudioIn.ar([1, 2]) * 0.01;
var z = DelayC.ar(s.sum, 0.048, 0.048);
var y = CombC.ar(z, 0.1, LFNoise1.kr({ Rand.ir(0, 0.1) }.dup(6)) * 0.04 + 0.05, 15).sum;
4.timesRepeat({ y = AllpassC.ar(y, 0.050, { Rand.ir(0, 0.05) }.dup, 1) });
LeakDC.ar(y, 0.995)

//---- notes.md
_z_ is the reverb predelay time.

_y_ is 6 modulated comb delays in parallel followed by 4 allpass delays on each of two channels (8 total).
