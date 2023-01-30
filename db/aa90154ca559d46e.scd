// Sine ; envelope generator ; resets on trigger
SinOsc.ar(220, 0) * Sine.kr(Impulse.kr(0.5, 0), 1.5) * 0.1
