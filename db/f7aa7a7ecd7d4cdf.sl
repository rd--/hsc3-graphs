let x = Impulse(1, 0).Perc(0.01, 0.2, 0) * SinOsc(220, 0);
let l = LocalIn(1, 0) + x;
let y = DelayN(l, 0.1, 0.1);
y * 0.1 <! LocalOut(y * 0.8)
