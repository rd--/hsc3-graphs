{- bugs -}
let amp = 1.2; let ampLagTime = 20; let cutFreq = 600; let nse = 0.1; let nFreq = 800;
let src = { Lpf(PinkNoise() * nse, nFreq) * SinOsc(1750, 0) * SinOsc(160, 0) } ! 2;
let bugs = PitchShift(src, 0.2, LinLin(LfTri(20, 0), -1, 1, 0.9, 5), 0.01, 0.0001);
Hpf(Limiter(bugs, 0.9, 0.01) * Line(0, amp, ampLagTime), cutFreq)
