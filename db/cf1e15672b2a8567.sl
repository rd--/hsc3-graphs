let sig = LfSaw(10, 0);
let dist = ModDif(sig, 0, (0 .. 8) * MouseX(0, 1 / 5, 0, 0.2));
SinOsc(dist * 4000 + 400, 0).Splay * 0.1
