var decay = MouseX(0.99, 1.00001, 0, 0.1).Min(1);
var peak = PeakFollower(Dust(20) * Line(0, 1, 4), decay);
SinOsc(peak * 1500 + 200, 0) * 0.1
