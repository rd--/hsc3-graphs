{- trills ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #13e -}
let p = [1, 4] + 0.01;
Pan2(SinOsc(1400 * Lag((LfTri(p * 0.2, 0) / p).RoundTo(1 / 8), 0.002).Sum, 0), 0, 0.2)
