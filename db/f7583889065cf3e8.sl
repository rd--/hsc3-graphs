var p = WhiteNoise() * 0.05;
var q = LfSaw([200, 200.37, 201], 0).Sum * 0.03;
var [w, x, y] = PanB2(p, -0.5, 1) + PanB2(q, 0.5, 1);
var [rx, ry] = Rotate2(x, y, MouseX(-1, 1, 0, 0.2));
DecodeB2(8, w, rx, ry, 0)
