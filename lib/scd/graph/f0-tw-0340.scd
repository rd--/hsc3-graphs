// https://sccode.org/1-4Qy ; f0 ; 0340
var c = SinOscFB.ar(1 / [12, 8], 0) + 3 / 24;
var m = Duty.ar(c, 0, Dseq([0, 8, 5, 1, 5, 4, 5] * (c * 18).round, inf)) + 60;
AllpassN.ar(SinOscFB.ar(m.midiCps, c * 2), 0.2, 0.2, 1) / 2

//----tweet0340
a=SinOscFB;AllpassN ar:a.ar(midicps(Duty.ar(c=a.ar(1/[12,8])+3/24,0,Dseq([0,8,5,1,5,4,5]*round(c*18),inf))+60),c*2)/2
