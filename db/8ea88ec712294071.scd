// short-loops ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #14a
SinOsc.ar(LPF.ar(Stepper.ar(Impulse.ar(80), 0, 1, 512, 84), 1e3) * 20, 0, 0.2).dup
