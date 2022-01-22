// https://github.com/pangrus/hachi/blob/master/lib/engine_hachi.sc ; yh (yoshinosuke horiuchi)
var decay = 30;
var amp = 1;
var tone = 56;
var tr = Impulse.kr(LFNoise2(1) + 1.5, 0);
var env = Env.new([0.11, 1, 0], [0, decay], -225).kr(gate: tr);
var trienv = Env.new([0.11, 0.6, 0], [0, decay], -230).kr(gate: tr);
var fenv = Env.new([tone * 7, tone * 1.35, tone], [0.05, 0.6], -14).kr(gate: tr);
var pfenv = Env.new([tone * 7, tone * 1.35, tone], [0.03, 0.6], -10).kr(gate: tr);
var sig = SinOsc.ar(fenv, pi / 2) * env; // phase is not reset
var sub = LFTri.ar(fenv, pi / 2) * trienv * 0.05;
var punch = HPF.ar(SinOsc.ar(pfenv, pi / 2) * env * 2, 350);
Pan2.ar(Limiter.ar((sig + sub + punch) * 2.5, 0.5), 0, amp / 2)
