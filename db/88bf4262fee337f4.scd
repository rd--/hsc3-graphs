// MiElements ; basic
{var input = PinkNoise.ar(0.3);
 var gate = LFPulse.kr(2);
 var pitch = 45;
 MiElements.ar(input, 0, gate, pitch)}
