let trig = Impulse(6, 0).kr;
let index = TwIndex(trig, 0, [0.05, 0.45, 0.5]);
SinOsc(Select(index, [333 444 555]), 0) * 0.1
