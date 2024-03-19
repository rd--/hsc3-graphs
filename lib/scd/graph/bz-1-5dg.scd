// https://sccode.org/1-5dg (bz) kd=kick drum, sd = snare drum, hh = hi-hat, tm = tom, cl = clave, wd = wood block
arg clVel = 30,
	div1 = 2,
	div2 = 3,
	div3 = 4,
	div4 = 6,
	div5 = 8,
	div6 = 3,
	hhVel = 110,
	kdDcy = 4,
	kdFreq = 45,
	kdRes = 0.05,
	kdVel = 86,
	sdDcy = 4,
	sdVel = 74,
	speed = 1,
	swing = 0.5,
	tmFreq = 135,
	tmVel = 70,
	wdVel = 100;
var master = (LFSaw.ar(speed, pi) * 0.5 + 0.5).lincurve(0, 1, 0, 1, 0.5);
var div = [div1, div2, div3, div4, div5, div6];
var trig = (master % (1 / div)) * div;
var kdEnv = (((trig[0].neg + 1).lincurve(0, 1, 0, 1, kdDcy).cubed * 2) + 1).lag(0.001);
var sdEnv = ((trig[1].neg + 1).lincurve(0, 1, 0, 1, sdDcy).cubed).lag(0.001);
var kd = Resonz.ar(trig[0], kdFreq * kdEnv, 0.005) * kdVel;
var sd = (Resonz.ar(trig[1], 222, 0.02) * 4 + (WhiteNoise.ar() + Dust2.ar(123) * 0.01)) * sdEnv.tanh * sdVel;
var hh = RHPF.ar(Mix.new(Resonz.ar(trig[2], Array.linrand(11, 4000, 6500), 0.0005)), 2400, 0.4) * hhVel;
var tm = Resonz.ar(trig[3], tmFreq, 0.03) * tmVel;
var cl = HPF.ar(Mix.new(Resonz.ar(trig[4], Array.linrand(9, 500, 3500), 0.01) * clVel), 700);
var wd = Resonz.ar(trig[5], 850, 0.04) * wdVel;
(kd + sd + hh + tm + cl + wd).tanh.dup * 0.15