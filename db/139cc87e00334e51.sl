{- impulse sequencer (jmcc) Sc2 -}
let t = Impulse(8, 0);
let seq = { :s | t * Demand(t, 0, Dseq(inf, s)) };
let cSeq = seq([1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0]);
let dSeq = seq([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0]);
let nSeq = seq([1.0, 0.1, 0.1, 1.0, 0.1, 1.0, 0.1, 0.1]);
let bSeq = seq([1, 0, 0.2, 0, 0.2, 0, 0.2, 0]);
let c = Decay2(cSeq, 0.001, 0.3) * SinOsc(1700, 0) * 0.1;
let d = Decay2(dSeq, 0.001, 0.3) * SinOsc(2400, 0) * 0.04;
let n = Decay2(nSeq, 0.001, 0.25) * BrownNoise() * 0.1;
let b = Decay2(bSeq, 0.001, 0.5) * SinOsc(100, 0) * 0.2;
c + d + n + b
