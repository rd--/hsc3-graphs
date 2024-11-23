/* Cc ; continuous controller ; one indexed */
let f = Lag(Cc(1), 0.1) * 110 + 110;
let nh = Lag(Cc(2), 0.2) * 9 + 1;
let a = Lag(Cc(3), 0.3) * 0.1;
let p = Lag(Cc(4), 0.4) * 2 - 1;
Pan2(Blip(f, nh) * a, p, 1)
