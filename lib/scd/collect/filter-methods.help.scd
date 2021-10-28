// allpassC ; allpass delay
WhiteNoise.ar().mul(0.05).allpassC(0.01, XLine.kr(0.0001, 0.01, 20), 0.2)

// allpassC ; all pass delay
PinkNoise.ar().allpassC(0.2, 0.2, 1.0).mul(0.1)

// allpassN ; all pass delay (left to right)
Dust.ar(1).mul(0.25).decay(0.2).mul(WhiteNoise.ar()).allpassN(0.2, 0.2, 3)

// allpassN ; all pass delay (right to left)
AllpassN.ar(Decay.ar(Dust.ar(1) * 0.25, 0.2) * WhiteNoise.ar, 0.2, 0.2, 3)

// bpz ; two zero fixed midpass
PinkNoise.ar().bpz2.mul(0.1)

// combC ; comb delay
WhiteNoise.ar().mul(0.05).combC(0.01, XLine.kr(0.0001, 0.01, 20), 0.2)

// hpf ; high pass filter
PinkNoise.ar().hpf(2300).mul(0.1)

// lpf ; low pass filter
PinkNoise.ar().lpf(220).mul(0.1)

// resonz ; resonant filter
PinkNoise.ar().resonz(880, 0.1).mul(0.1)

// allpassC ; default value
PinkNoise.ar().allpassC.mul(0.1)

// hpf ; default value
PinkNoise.ar().hpf.mul(0.1)

// lpf ; default value
PinkNoise.ar().lpf.mul(0.1)

// resonz ; default values
PinkNoise.ar().resonz.mul(0.1)

