/* short-loops ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #14c */
Pan2(SinOsc(Lpf(Stepper(Impulse(10, 0), 0, 1, 16, [4, 7, 10, 12], 1), 1000) * 70, 0).Sum, 0, 0.2)
