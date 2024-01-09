// https://twitter.com/hrhkymd/status/1601331785409134592
var b = 1 / 25.6;
var p = Impulse.kr(b, 0);
var f = TChoose.kr(p, [[58, 58.2, 62], [56, 56.2, 67]]) ++ [39, 51, 60, 63, 65];
var t = TChoose.kr(p, [-2, 0, 4]) + f;
{
	DynKlang.ar(
		Ref([
			t.midicps,
			{ (LFPulse.ar(b * 16, pi, LFNoise0.ar(500)) * LFNoise0.ar(b * 128).range(0, 0.2)).lag(10) } ! 9,
			RLPF.ar(VarSaw.ar(b * 32, 0, 0.5) * 2000, 9, 0.1) * 0.001 + 10
		])
	)
} ! 2

// ---- https://twitter.com/hrhkymd/status/1601331785409134592
c=TChoose;f=kr(c,p=kr(Impulse,b=1/25.6),[[58,58.2,62],[56,56.2,67]])++[39,51,60,63,65];t=kr(c,p,[-2,0,4])+f;{ar(DynKlang,`[t.midicps,{ar(LFPulse,b*16,pi,ar(l=LFNoise0),ar(l,b*128).range(0,0.2)).lag(10)}!9,ar(RLPF,ar(VarSaw,b*32,0,0.5,2e3),9,0.1,1e-3,10)])}!2
