{- https://sccode.org/1-5dg (bz) kd=kick drum, sd = snare drum, hh = hi-hat, tm = tom, cl = clave, wd = wood block -}
let ctl = (
	clVel: 30,
	div: [2, 3, 4, 6, 8, 3],
	hhVel: 110,
	kdDcy: 4,
	kdFreq: 45,
	kdRes: 0.005,
	kdVel: 86,
	sdDcy: 4,
	sdVel: 74,
	speed: 1,
	swing: 0.5,
	tmFreq: 135,
	tmVel: 70,
	wdVel: 100
).localControls;
let rGen = { :k :l :r | { system.nextRandomFloatLinearDistribution(l, r) } ! k };
let master = (LfSaw(ctl::speed, pi) * 0.5 + 0.5).LinCurve(0, 1, 0, 1, ctl::swing);
let trig = (master % (1 / ctl::div)) * ctl::div;
let kdEnv = (((trig[1].negated + 1).LinCurve(0, 1, 0, 1, ctl::kdDcy).cubed * 2) + 1).Lag(0.001);
let sdEnv = ((trig[2].negated + 1).LinCurve(0, 1, 0, 1, ctl::sdDcy).cubed).Lag(0.001);
let kd = Resonz(trig[1], ctl::kdFreq * kdEnv, ctl::kdRes) * ctl::kdVel;
let sd = (Resonz(trig[2], 222, 0.02) * 4 + (WhiteNoise() + Dust2(123) * 0.01)) * sdEnv.Tanh * ctl::sdVel;
let hh = Rhpf(Resonz(trig[3], 11.rGen(4000, 6500), 0.0005).sum, 2400, 0.4) * ctl::hhVel;
let tm = Resonz(trig[4], ctl::tmFreq, 0.03) * ctl::tmVel;
let cl = Hpf((Resonz(trig[5], 9.rGen(500, 3500), 0.01) * ctl::clVel).sum, 700);
let wd = Resonz(trig[6], 850, 0.04) * ctl::wdVel;
(kd # 2 + sd + hh + tm + cl + wd).Tanh * 0.15
