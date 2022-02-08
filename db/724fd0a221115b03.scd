// one line (lp)
var lfs = LFSaw.ar(#[1, 0.99], #[0, 0.6]);
var sft = (lfs * 2000 + 2000).trunc(#[400, 600]) * #[1, -1];
Pan2.ar(SinOsc.ar(OnePole.ar(sft.sum, 0.98), 0), 0, 0.05)
