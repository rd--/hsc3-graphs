(* short-loops ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #14d *)
Pan2(SinOsc(Lpf(Stepper(Impulse(10, 0), 0, 1, 16, [3, 7, 10, 11], 1), 1000) * 90, 0).Sum, 0, 0.2)
