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
