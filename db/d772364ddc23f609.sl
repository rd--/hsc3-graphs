{- SvfBp ; modulating F -}
let f = SinOsc(XLine(0.7, 300, 20), 0) * 3600 + 4000;
SvfBp(Saw(200) * 0.1, f, 1)
