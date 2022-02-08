// short-loops ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #14c
Mix(SinOsc.ar(LPF.ar(Stepper.ar(Impulse.ar(10), 0, 1, 16, [4,7,10,12]), 1e3) * 70, 0, 0.2)).dup
