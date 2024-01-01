var nc = 12;
var x = SinOsc(RandN(nc, 300, 800), 0);
var d = ModDif (MouseX(0, nc * 2, 0, 0.2), [0 .. nc - 1], nc);
(x * (1 - d).Max(0)).Splay * 0.1
