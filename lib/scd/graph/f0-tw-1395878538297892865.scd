// f0  https://twitter.com/redFrik/status/1395878538297892865
var t = Impulse.ar(5, 0);
var g = #[3, 2];
var e = t.lagud(0.001, SinOscFB.ar(g / 99, 0) + 1.08);
var m = [24,0,3,5,7,10,36].collect({ | i | i + [36,48,36,33,60,72]}).flat;
var o = SinOscFB.ar(Demand.ar(t, 0, Dseq.dr(m.midicps, inf) / g), SinOscFB.ar(0.02, 0)) * e;
var c = RLPF.ar(o, 3 ** SinOscFB.ar(0.04, 0) + e * 2000, 3 ** SinOscFB.ar(g / 9, 0) / 3) * 4;
(CombN.ar(c.tanh, 1, 1 / 2, 4) + CombN.ar(c, 1, 1 / 3, 5) / 8 + c).tanh * 0.1

// ---- f0  https://twitter.com/redFrik/status/1395878538297892865
var t = Impulse.ar(freq: 5, phase: 0);
var g = [3, 2];
var e = t.lagud(lagTimeU: 0.001, lagTimeD: SinOscFB.ar(freq: g/99, feedback: 0) + 1.08);
var m = ([24,0,3,5,7,10,36] +.t [36,48,36,33,60,72]).flat;
var f = Demand.ar(trig: t, reset: 0, demandUGens: Dseq.dr(list: m.midicps, repeats: inf) / g);
var o = SinOscFB.ar(freq: f, feedback: SinOscFB.ar(freq: 0.02, feedback: 0), mul: e);
var p = 3 ** SinOscFB.ar(freq: 0.04, feedback: 0) + e * 2000;
var c = RLPF.ar(in: o, freq: p, rq: 3 ** SinOscFB.ar(freq: g/9, feedback: 0) / 3, mul: 4);
var z = CombN.ar(in: [c.tanh, c], maxdelaytime: 1, delaytime: [1/2, 1/3], decaytime: [4, 5]).sum;
(z / 8 + c).tanh * 0.1

//---- f0 ; https://twitter.com/redFrik/status/1395878538297892865
{tanh(ar(f=CombN,c=ar(RLPF,ar(a=SinOscFB,ar(Demand,t=Impulse ar:5,0,Dseq(midicps(flat([24,0,3,5,7,10,36]+.t[36,48,36,33,60,72])),inf)/g=[3,2]),a ar:0.02,e=t.lagud(1e-3,SinOscFB.ar(g/99)+1.08)),3**SinOscFB.ar(0.04)+e*2e3,3**SinOscFB.ar(g/9)/3,4).tanh,1,1/2,4)+ar(f,c,1,1/3,5)/8+c) * 0.1}

//---- ; notes
p = [24,0,3,5,7,10,36] +.t [36,48,36,33,60,72]
q = [[60,72,60,57,84,96],[36,48,36,33,60,72],[39,51,39,36,63,75],[41,53,41,38,65,77],[43,55,43,40,67,79],[46,58,46,43,70,82],[72,84,72,69,96,108]]
p == q
p == [24,0,3,5,7,10,36].collect({arg i; i + [36,48,36,33,60,72]})