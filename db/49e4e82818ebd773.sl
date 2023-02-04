;; sweep verb ; jmcc #5 ; requires=AudioIn
var s = AudioIn([1, 2]) * 0.01;
var z = DelayC(s.sum, 0.048, 0.048);
var y = CombC(z, 0.1, LfNoise1({ Rand(0, 0.1) } ! 6) * 0.04 + 0.05, 15).sum;
4.timesRepeat { y := AllpassC(y, 0.050, { Rand(0, 0.05) } ! 2, 1) };
LeakDc(y, 0.995)