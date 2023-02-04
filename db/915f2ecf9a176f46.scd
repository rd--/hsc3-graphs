// https://twitter.com/HernaniVillase/status/562825448854675456 ; edit (rd)
{
	var o = LFTri.ar(Duty.kr(0.1, 0, Dseq([999, 99, 4000], inf), 0), 0);
	AllpassC.ar(o * Dust.kr(Duty.kr(1, 0, Dseq([1, 5], inf), 0)), 0.2, 0.02, 1)
} ! 2
