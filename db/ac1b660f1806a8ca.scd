// ping pong ; https://github.com/cianoc/supercollider_fragments
var rate = 5;
var trig = Impulse.kr(5);
var freq = TRand.kr([36, 60], [72, 86], trig).midicps;
var ratio = 2;
var env = EnvGen.kr(Env.perc(0, 1 / rate), gate: trig);
PMOsc.ar(freq, freq * ratio, 3 + env * 4, mul: env * 0.25)
