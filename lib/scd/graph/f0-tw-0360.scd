// https://sccode.org/1-4Qy ; f0 ; 360
var t = SinOsc.ar([7.992, 8], 0);
var e = EnvGen.ar(Env.perc(0.005, 0.2, 1, -4), t);
var f = [0, 1].collect({
	arg i;
	var q = [
		Dseq.dr('@BGIJB@IGBJI'.ascii, 240),
		Dseq.dr('@LEGJLEG'.ascii, 120),
		Dseq.dr('EGJL'.ascii, 60)
	];
	Demand.ar(t[i], 0, Dseq.dr(q, 1)).midiCps
});
var x = SinOsc.ar(f, SinOsc.ar(1 / [12, 9], 0) / 4 + 1 * SinOsc.ar(f, e * pi)) * e / 2;
FreeVerb2.ar(x[0], x[1], 0.1, 1, 0)

//--tweet0360 (piano phase)
a=SinOsc;e=EnvGen.ar(Env.perc(5e-3,0.2),t=a.ar([7.992,8]));f={|i|Demand.ar(t[i],0,Dseq([Dseq('@BGIJB@IGBJI'.ascii,240),Dseq('@LEGJLEG'.ascii,120),Dseq('EGJL'.ascii,60)])).midicps}!2;x=a.ar(f,a.ar(1/[12,9])/4+1*a.ar(f,e*pi))*e/2;FreeVerb2.ar(x@0,x@1,0.1,1,0)
