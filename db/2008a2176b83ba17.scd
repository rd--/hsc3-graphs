// MiRings ; easter egg
{var trig = Impulse.kr(0.3);
 var pitch = Latch.kr(WhiteNoise.kr(), trig).range(24, 48).round;
 var brightness = LFNoise1.kr(0.5).range(0.2,0.9);
 var position = LFNoise1.kr(0.4).range(0,1);
 MiRings.ar(pit: pitch, bright: brightness, pos: position, damp: 0.8, poly: 1, model: 0, easteregg: 1) * 0.25}
