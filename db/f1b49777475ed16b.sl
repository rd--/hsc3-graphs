let decay = MouseX(0, 1.1, 0, 0.1).Min(1);
let peak = PeakFollower(SinOsc(0.2, 0), decay);
SinOsc(peak * 200 + 500, 0) * 0.1
