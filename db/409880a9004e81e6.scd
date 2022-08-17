// GrayNoise
var amp = LFPulse.kr(4, 0, 0.1) * 0.002;
var exc = LPZ1.ar({ GrayNoise.ar }.dup(2) * amp);
RingzBank.ar(exc, { Rand.ir(80, 400) }.dup(4), nil, nil)
