{- tutorial 2.5 ; am, fm, chorus -}
let src = Saw([440 443 437] + (SinOsc(100, 0) * 100));
let amp = LfSaw(Line(3, 17, 3),0) * 0.5 + 0.5 * Line(1, 0, 10);
Resonz(src, XLine(10000, 10, 10), Line(1, 0.05, 10)).Sum * amp
