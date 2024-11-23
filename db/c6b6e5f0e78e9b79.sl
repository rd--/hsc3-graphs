/* Sine ; fixed duration envelope generator ; resets on trigger */
SinOsc(220, 0) * Sine(Impulse(0.5, 0), 1.5) * 0.1
