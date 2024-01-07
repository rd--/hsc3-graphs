(* 20061023 ; rd *)
let n1 = LfNoise0([0.5, 1.5]);
let o = SinOsc(n1, 0);
let a = Slope(o).Abs * [2, 3];
let t = Impulse(a, 0);
let i = Decay2(t, 0.1, 0.2);
let x = MouseX(960, 3620, 1, 0.2);
let y = MouseY(0.5, 2.0, 0, 0.2);
let n2 = TRand(x, 3940, t);
let n3 = TRand(0.005, 0.275, t);
Ringz(i, n2, n3 * y)
