{- Feedback racket ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #12d -}
let p = WhiteNoise(2) * 0.02;
p + CombC(p, 0.1, LfNoise1(10) * 0.08 + 0.08, -10000)
