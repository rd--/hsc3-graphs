;; strummable metals ; use mouse to strum strings ; jmcc ; requires=Klank
var mousex = MouseX(0, 1, 0, 0.2);
var strFunc = { :i |
	var trigger = Hpz1(mousex > (0.25 + (i * 0.07))).Abs;
	var pluck = PinkNoise() * Decay(trigger, 0.05).kr * 0.04;
	var n = 15;
	var z = [{ 300 * i + LinRand(0, 8000, 0) } ! n, nil, { Rand(1, 4) } ! n].asKlankSpec;
	Pan2(Klank(pluck, 1, 0, 1, z), i * 0.2 - 0.5, 1);
};
LeakDc(Lpf((1 .. 8).collect(strFunc).sum, 12000), 0.995)