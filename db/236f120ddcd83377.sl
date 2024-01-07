let nc = 12;
let x = SinOsc(RandN(nc, 300, 800), 0);
let d = ModDif (MouseX(0, nc * 2, 0, 0.2), [0 .. nc - 1], nc);
(x * (1 - d).Max(0)).Splay * 0.1
