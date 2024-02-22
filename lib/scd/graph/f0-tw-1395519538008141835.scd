// f0 ; https://twitter.com/redFrik/status/1395519538008141835
var c = Duty.ar(0.004, 0, Dseries(1, [1, 2], inf) % Duty.ar(8.192, 0, Dseq((1 .. 6) * 75, inf)));
var d = HPF.ar(MantissaMask.ar(c, 3),5);
var f = { arg x; SinOscFB.ar(x, 0).max(0) };
var p = [250, 200] * Duty.ar(4.096, 0, Dseq([4, 6, 5, 5, 5, 5, 3] / 4, inf)).lag(0.1);
var o = SinOscFB.ar(p, f.value(0.08)) * f.value(1 / [99, 60]) / 3;
LPF.ar((d.sin + (SinOscFB.ar(63, f.value(0.8)) * d) / 9 + o).tanh / 2, 10000) * 0.1

//---- f0 ; https://twitter.com/redFrik/status/1395519538008141835
ar(LPF,tanh(sin(d=ar(HPF,ar(MantissaMask,c=ar(b=Duty,4e-3,0,Dseries(1,[1,2],i=inf)%ar(b,8.192,0,Dseq((1..6)*75,i)))),5))+ar(a=SinOscFB,63,(f=ar(a,_).max).(0.8),d)/9+ar(a,[250,200]*ar(b,4.096,0,Dseq([4,6,5,5,5,5,3]/4,i)).lag,f.(0.08),f.(1/[99,60])/3))/2,1e4)*0.1

//---- calculations
(1..6) == (6.iota + 1) // iota
