(* Trills ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #13b *)
let p = [1, 2] + 0.01;
Pan2(SinOsc(1000 * Lag((LfSaw(p * 0.4, 0) / p).RoundTo(1 / 6), 0.002).Sum, 0), 0, 0.2)
