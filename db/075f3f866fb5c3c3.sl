{- short-loops ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #14e -}
Pan2(SinOsc(Rlpf(Stepper(Impulse(8, 0), 0, 1, 8, [1, 2, 3], 1), 1000, 0.01) * 200, 0).Sum, 0, 0.1)
