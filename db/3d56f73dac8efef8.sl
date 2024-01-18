{- Wandering sines ; https://github.com/cianoc/supercollider_fragments -}
let f = (LfNoise1(0.5) * 600 + (LfSaw(1.5, 0) * 50 + 500)).Abs;
let o = SinOsc(f, 0) * 0.1;
let d = CombN(o, 3.0, [1.35, 0.7], 6);
Pan2(o, 0, 1) + d
