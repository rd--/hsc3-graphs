// https://github.com/pangrus/hachi/blob/master/lib/engine_hachi.sc ; yh (yoshinosuke horiuchi)
var decay = 30;
var amp = 1;
var tone = 56;
var tr = Impulse.kr(LFNoise2.kr(1) + 1.5, 0);
var env = Env.new([0.11, 1, 0], [0, decay], -225).kr(0, tr);
var triEnv = Env.new([0.11, 0.6, 0], [0, decay], -230).kr(0, tr);
var fEnv = Env.new([tone * 7, tone * 1.35, tone], [0.05, 0.6], -14).kr(0, tr);
var pfEnv = Env.new([tone * 7, tone * 1.35, tone], [0.03, 0.6], -10).kr(0, tr);
var sig = SinOsc.ar(fEnv, pi / 2) * env; // phase is not reset
var sub = LFTri.ar(fEnv, pi / 2) * triEnv * 0.05;
var punch = HPF.ar(SinOsc.ar(pfEnv, pi / 2) * env * 2, 350);
Pan2.ar(Limiter.ar((sig + sub + punch) * 2.5, 0.5, 0.01), 0, amp / 2)
