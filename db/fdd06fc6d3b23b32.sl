(* bugs *)
var amp = 1.2, ampLagTime = 20, cutFreq = 600, nse = 0.1, nFreq = 800;
var src = { Lpf(PinkNoise() * nse, nFreq) * SinOsc(1750, 0) * SinOsc(160, 0) } ! 2;
var bugs = PitchShift(src, 0.2, LinLin(LfTri(20, 0), -1, 1, 0.9, 5), 0.01, 0.0001);
Hpf(Limiter(bugs, 0.9, 0.01) * Line(0, amp, ampLagTime), cutFreq)
