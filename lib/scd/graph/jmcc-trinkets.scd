// trinkets (1 & 2) (jmcc) ; http://www.iamas.ac.jp/~aka/dspss2004/materials/
var amp = 0.2;
var gate = 1;
var nc = 2;
var z = 0.0, a = 0.1, b = 0.2, c = 0.4;
var clock = [Dust.kr(4), Impulse.kr(16, 0)].choose;
var x = SinOsc.ar( TRand.kr([400, 2000].choose, 12000, clock), 0) * Decay2.kr(clock, 0.002, 0.04);
x = PanAz.ar(nc, x, TRand.kr(-1, 1, clock));
x = CombN.ar(x, 0.2, { Rand.ir(0.04, 0.2) }.dup(4), 2);
x * Linen.kr(gate, 0.1, amp, 0.3, 2);
