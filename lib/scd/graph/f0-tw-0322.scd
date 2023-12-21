// https://sccode.org/1-4Qy ; f0 ; 0322
var c = SinOscFB.ar([1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144] / (SinOscFB.ar(1 / [2, 4], 0) % 1 + 0.125).roundTo(1), 1);
var m = c > 0 * [9, 2, 3, 0, 7, 5] + 55;
Splay2.ar(SinOscFB.ar(m.midiCps, SinOscFB.ar(c / 999, 0) + 1 / 2)) / 3

// ---- calculations
12.fib == [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144]

// ---- tweet0322
a=SinOscFB;Splay ar:a.ar(midicps(c=a.ar(12.fib/round(a.ar(1/[2,4])%1+0.125),1)>0*[9,2,3,0,7,5]+55),a.ar(c/999)+1/2)/3
