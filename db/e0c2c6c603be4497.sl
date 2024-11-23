let gate = LfPulse(0.5, 0, 0.5) > 0;
let attackTime = 0.05;
let decayTime = 0.15;
let sustainLevel = 0.4;
let releaseTime = 0.1;
let curve = 0;
let envelope = Adsr(gate, attackTime, decayTime, sustainLevel, releaseTime, curve);
SinOsc(440, 0) * envelope * 0.1
