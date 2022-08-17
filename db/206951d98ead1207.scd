// MiElements ; ringing ; use 'blow' input and contour set to 0.5
var blow_in = PinkNoise.ar() * 0.3;
var gate = 1;
MiElements.ar(blow_in: blow_in, strike_in: 0, gate: gate, pit: 48, strength: 0.5, contour: 0.5)
