// https://swiki.hfbk-hamburg.de/MusicTechnology/899 (nv) L43
var f = { arg i;
	var x = Impulse.ar(1, i / 10) + Impulse.ar(0, 0);
	var o = LFSaw.ar(#[102, 101], 0);
	var d = 1 / Latch.ar(1.015 ** Sweep.ar(0, 1) * 64 % 1 + 1 * 200, x);
	Pluck.ar(o, x, 1, d, 4, 0.2)
};
f.dup(10).mean

// ---- https://swiki.hfbk-hamburg.de/MusicTechnology/899 (nv) L43 ; keyword arguments
var f = { arg i;
    var x = Impulse.ar(freq: 1, phase: i / 10) + Impulse.ar(freq: 0, phase: 0);
    var o = LFSaw.ar(freq: [102, 101], iphase: 0);
    var d = 1 / Latch.ar(in: 1.015 ** Sweep.ar(trig: 0, rate: 1) * 64 % 1 + 1 * 200, trig: x);
    Pluck.ar(in: o, trig: x, maxdelaytime: 1, delaytime: d, decaytime: 4, coef: 0.2)
};
0.to(9).collect(f).mean

// ---- https://swiki.hfbk-hamburg.de/MusicTechnology/899 (nv) L43
{var p=Impulse;mean({|i|Pluck.ar(LFSaw.ar([102,101]),x=p.ar(1,i/10)+p.ar(0),1,1/Latch.ar(1.015**Sweep.ar(0,1)*64%1+1*200,x),4,0.2)}!10)}
