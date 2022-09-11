// https://sccode.org/1-4Qy ; f0 ; 0006
{
	{
		var n = MoogFF.ar(ClipNoise.ar * 0.4, LFPar.kr({ Rand.ir(0, 0.3) }.dup(2), 0) * 600 + 990, 2, 0);
		Release.ar(GVerb.ar(n, 9, 9, 1, 0.5, 15, 1, 0.7, 0.5, 300) * 0.1, 3, 0, 19)
	}.play;
	3.seconds.wait;
}.loop

//----tweet0006
r{loop{x={GVerb.ar(MoogFF.ar(ClipNoise.ar*0.4,LFPar.kr({0.3.rand}!2,0,600,990)),9,9,1)}.play(s,0,19);3.wait;x.release}}.play
