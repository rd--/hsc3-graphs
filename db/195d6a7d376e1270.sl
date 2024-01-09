(* https://github.com/pangrus/hachi/blob/master/lib/engine_hachi.sc ; yh (yoshinosuke horiuchi) *)
let decay = 30;
let amp = 1;
let tone = 56;
let tr = Impulse(LfNoise2(1) + 1.5, 0);
let mkEnv = { :l :t :c |
	Env(l, t, c, nil, nil, 0).asEnvGen(tr)
};
let env = mkEnv([0.11, 1, 0], [0, decay], -225);
let triEnv = mkEnv([0.11, 0.6, 0], [0, decay], -230);
let fEnv = mkEnv([tone * 7, tone * 1.35, tone], [0.05, 0.6], -14);
let pfEnv = mkEnv([tone * 7, tone * 1.35, tone], [0.03, 0.6], -10);
let sig = SinOsc(fEnv, pi / 2) * env; (* phase is not reset *)
let sub = LfTri(fEnv, pi / 2) * triEnv * 0.05;
let punch = Hpf(SinOsc(pfEnv, pi / 2) * env * 2, 350);
Pan2(Limiter((sig + sub + punch) * 2.5, 0.5, 0.01), 0, amp / 2)
