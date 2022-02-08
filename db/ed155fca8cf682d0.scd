// short-loops ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #14e
Mix(SinOsc.ar(RLPF.ar(Stepper.ar(Impulse.ar(8), 0, 1, 8, [1,2,3]), 1e3, 0.01) * 200, 0, 0.1)).dup
