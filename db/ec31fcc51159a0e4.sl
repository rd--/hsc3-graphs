(* https://scsynth.org/t/5487 ; mv *)
let prime = LfNoise0(1 / 19) * 8 + 300;
let diff = LfNoise0(1 / 29) + 10;
let fade = 10;
let primetime = 20;
let difftime = 30;
let level= 0.075;
let freqtransition = Lag(prime, primetime);
let left = SinOsc(freqtransition, 0);
let right = SinOsc(freqtransition - Lag(diff, difftime), 0);
let env = Line(0, level, fade);
let brainwave = [left, right] * env;
let tr = Dust(1 / 9);
let freq = TExpRand(285, 310, tr);
let amp = TRand(0.1, 0.2, tr);
let sustain = TRand(7, 14, tr);
let pan = TRand(-0.7, 0.7, tr);
let sig = SinOsc(freq, 0) * amp * Decay2(tr, 0.01, sustain);
brainwave + EqPan(sig, pan)
