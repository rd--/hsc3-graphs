{- EnvGen ; if gate < 0 then the envelope will end immediately with release time set to 0 - gate + 1 -}
let gate = LinLin(LfPulse(0.25, 0, 0.1), -1, 1, MouseX(-25, 0, 0, 0.2), 1);
PinkNoise() * Asr(gate, 0.01, 1, -4) * 0.1
