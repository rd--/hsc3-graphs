// short-loops ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #14b
Mix(SinOsc.ar(LPF.ar(Stepper.ar(Impulse.ar(10), 0, 1, 12, [3,4,10]), 1e3) * 100, 0, 0.2)).dup
