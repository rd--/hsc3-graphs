// eggcrate ; rd
var eggcrate = { arg u, v; (u * pi).cos * (v * pi).sin };
var p = #[64, 72, 96, 128, 256, 6400, 7200, 8400, 9600];
var x = BrownNoise.kr;
var y = BrownNoise.kr;
var t = Dust.kr(2.4);
var f0 = TChoose.kr(t, p);
var f1 = TChoose.kr(t, p);
var f = LinLin.kr(eggcrate.value(x,y), -1, 1, f0, f1);
var a = LinLin.kr(x, -1, 1, 0, 0.1);
Pan2.ar(Mix.ar(SinOsc.ar(f, 0)), y, a)

//---- eggcrate ; rd ; keywords
var eggcrate = { arg u, v; (u * pi).cos * (v * pi).sin };
var p = #[64, 72, 96, 128, 256, 6400, 7200, 8400, 9600];
var x = BrownNoise.kr;
var y = BrownNoise.kr;
var t = Dust.kr(density: 2.4);
var f0 = TChoose.kr(trig: t, array: p);
var f1 = TChoose.kr(trig: t, array: p);
var f = LinLin.kr(in: eggcrate.value(x,y), srclo: -1, srchi: 1, dstlo: f0, dsthi: f1);
var a = LinLin.kr(in: x, srclo: -1, srchi: 1, dstlo: 0, dsthi: 0.1);
Pan2.ar(in: Mix.ar(SinOsc.ar(freq: f, phase: 0)), pos: y, level: a)
