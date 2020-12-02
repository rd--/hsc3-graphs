// MiElements ; mallets ; particles
{var strike_timbre = LFNoise1.kr(0.3,0.5,0.5);
 var g = LFNoise2.kr(0.1).range(0.4,0.7);
 var maltype = 1;     // mallet type: 1 --> uses internal model of bouncing particles
 MiElements.ar(gate: 1, pit:40, geom: g, contour:0.5, strike_level: 0.5, mallet: maltype, strike_timb: strike_timbre)}
