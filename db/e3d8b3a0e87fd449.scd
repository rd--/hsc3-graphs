// Balance2
var o = SinOsc.ar(#[440, 550], 0); Balance2.ar(o.first, o.second, LFNoise1.ar(4), 0.3)
