var mx = MouseX(-200, 200, 0, 0.2);
var my = MouseY(-200, 200, 0, 0.2);
var freq = SinOsc(0.3, 0) * 20.Lcm([mx, my]) * 30 + 500;
SinOsc(freq, 0) * 0.1
