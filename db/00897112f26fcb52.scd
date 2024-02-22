// swept resonant noise (jmcc) #2 ; texture=overlap,4,4,5,inf
var p = 10;
var n = WhiteNoise.ar(0.007);
var f = FSinOsc.kr(0.1 + Rand(0, 0.2), 0, 12 + Rand(0, 12), 60 + Rand(-24, 24)).midicps;
var sweep = Resonz.ar(n, f, 0.1);
var specFunc = {Ref.new([Array.fill(p, { 80 + LinRand(0, 10000, 0) }), nil, Array.fill(p, { 0.5 + Rand(0, 2) })]) };
var spec = Array.fill(2, specFunc);
Klank.ar(spec, sweep)
