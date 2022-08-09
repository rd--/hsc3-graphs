// https://swiki.hfbk-hamburg.de/MusicTechnology/899 (nv) L4
var f = 0;
inf.do({
	arg i;
	f = i / 12 + f % [4,3];
	{
		var e = Line.kr(start: 0.1, end: 0, dur: 1, mul: 1, add: 0, doneAction: 2);
		Formant.ar(fundfreq: 2 ** f * 100, formfreq: 2 ** (i % 8 * f * 0.2) * 100, bwfreq: 100) * e
	}.play;
	0.25.wait
})

// https://swiki.hfbk-hamburg.de/MusicTechnology/899 (nv) L4
f=0;Routine({inf.do({|i|f=i/12+f%[4,3];{Formant.ar(2**f*100,2**(i%8*f*0.2)*100,100)*Line.kr(0.1,0,1,1,0,2)}.play;0.25.wait;})}).play
