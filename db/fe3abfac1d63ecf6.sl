{- Feedback racket ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #12c -}
let p = PinkNoise(2) * 0.03;
p + CombC(p, 0.2, LfNoise0(1) * 0.2 + 0.2, -10000)
