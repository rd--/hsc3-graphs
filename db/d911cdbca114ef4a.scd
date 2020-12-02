// MiElements ; ringing ; use 'blow' input and contour set to 0.5
{var input = PinkNoise.ar(0.3);
 var gate = 1;
 MiElements.ar(input, 0, gate, 48, contour:0.5)}
