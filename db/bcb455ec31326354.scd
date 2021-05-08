// BlockSize (default=64)
{var x = MouseX.kr(minval: 2, maxval: 8, warp: 0, lag: 0.2)
;SinOsc.ar(freq: [BlockSize.ir,ControlDur.ir * SampleRate.ir] * x, phase: 0, mul: 0.05)}
