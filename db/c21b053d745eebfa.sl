{- http://fredrikolofsson.com/f0blog/more-sc-twitter/, F0 (0061) -}
let t = Saw([9, 9.01]);
let f = Demand(t, 0, Dseq(inf, [0, 0, 0, 0, 0, 0, 500]));
let p = SinOsc(Lag(Demand(t, 0, Dshuf(inf, 0:7 - 1 * 99)), 0.04), 0);
SinOsc(f, p) / 4
