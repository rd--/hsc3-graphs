// SinOsc ; phase modulation
SinOsc.ar(MouseY.kr(1, 880, 0, 0.2), SinOsc.kr(MouseX.kr(0, 10, 0, 0.2))) * 0.1
