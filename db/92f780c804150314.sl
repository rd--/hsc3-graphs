{- http://twitter.com/n_peeq_t/status/1264595510217719809 -}
let b = 25;
let s = Decay(Dust(5), 1) * SinOsc(b * SinOsc(b, 0) * b, 0);
let f = Resonz(s, b ^ 2 * LfNoise0(5).Abs + b, 0.1);
GVerb(f, b, 4, 0.1, 0.3, 2, 1, 0.7, 0.5, 300) * 0.2
