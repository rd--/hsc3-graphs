// MiElements ; ringing ; use the 'strike' input (which bypasses the exciter section)
var strike_in = PinkNoise.ar() * 0.3;
MiElements.ar(blow_in: 0, strike_in: strike_in, gate: 0, pit: 48)
