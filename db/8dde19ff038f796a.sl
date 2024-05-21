let mx = MouseX(-200, 200, 0, 0.2);
let my = MouseY(-200, 200, 0, 0.2);
let freq = SinOsc(0.3, 0) * [mx, my].Gcd(20) * 30 + 500;
SinOsc(freq, 0) * 0.1
