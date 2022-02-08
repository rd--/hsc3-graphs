// short-loops ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #14d
Mix(SinOsc.ar(LPF.ar(Stepper.ar(Impulse.ar(10), 0, 1, 16, [3,7,10,11]), 1e3) * 90, 0, 0.2)).dup
