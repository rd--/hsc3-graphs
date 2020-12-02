// MiElements ; mallets ; strength
{var gate = CoinGate.kr(0.4, Impulse.kr(6));
 var stren = TRand.kr(trig: gate);
 var strike_timbre = LFNoise1.kr(0.3,0.5,0.5);
 MiElements.ar(gate: gate, pit:40, strength: stren, strike_level: 0.5, mallet:0.7, strike_timb: strike_timbre, bright: 0.3, damp: 0.85, space: 0.6)}
