let p = WhiteNoise() * 0.05;
let q = LfSaw([200, 200.37, 201], 0).Sum * 0.03;
let [w, x, y] = PanB2(p, -0.5, 1) + PanB2(q, 0.5, 1);
let [rx, ry] = Rotate2(x, y, MouseX(-1, 1, 0, 0.2));
DecodeB2(8, w, rx, ry, 0)
