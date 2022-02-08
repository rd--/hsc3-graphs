// BlockSize (default=64)
SinOsc.ar([BlockSize.ir(), ControlDur.ir() * SampleRate.ir()] * MouseX.kr(2, 8, 0, 0.2), 0) * 0.05
