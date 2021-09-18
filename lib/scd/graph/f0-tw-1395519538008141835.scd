// f0 ; https://twitter.com/redFrik/status/1395519538008141835
{var l = Dseries.new(start: 1, step: [1,2], length: inf) % Duty.ar(dur: 8.192, reset: 0, level: Dseq.new(list: 6.iota + 1 * 75, repeats: inf))
;var c = Duty.ar(dur: 0.004, reset: 0, level: l)
;var d = HPF.ar(in: MantissaMask.ar(in: c, bits: 3), freq: 5)
;var f = {arg x; SinOscFB.ar(freq: x, feedback: 0).max}
;var p = [250,200] * Duty.ar(dur: 4.096, reset: 0, level: Dseq.new(list: [4,6,5,5,5,5,3] / 4, repeats: inf)).lag
;var o = SinOscFB.ar(freq: p, feedback: f.value(0.08), mul: f.value(1 / [99,60]) / 3)
;LPF.ar(in: (d.sin + SinOscFB.ar(freq: 63, feedback: f.value(0.8), mul: d) / 9 + o).tanh / 2, freq: 10000) * 0.1}

// f0 ; https://twitter.com/redFrik/status/1395519538008141835
{var c = Duty.ar(0.004,0,Dseries.new(1,[1,2],inf) % Duty.ar(8.192,0,Dseq.new(6.iota+1*75,inf)))
;var d = HPF.ar(MantissaMask.ar(c),5)
;var f = {arg x; SinOscFB.ar(x).max}
;var o = SinOscFB.ar([250,200]*Duty.ar(4.096,0,Dseq.new([4,6,5,5,5,5,3]/4,inf)).lag,f.value(0.08),f.value(1/[99,60])/3)
;LPF.ar((d.sin + SinOscFB.ar(63,f.value(0.8),d)/9 + o).tanh / 2,10000) * 0.1}

// f0 ; subset (rd) ; https://twitter.com/redFrik/status/1395519538008141835
{var f = {arg x; SinOscFB.ar(freq: x, feedback: 0).max}
;var p = [250, 200] * Duty.ar(dur: 4.096, reset: 0, level: Dseq.new(list: [4, 6, 5, 5, 5, 5, 3] / 4, repeats: inf)).lag
;SinOscFB.ar(freq: p, feedback: f.value(0.08), mul: f.value(1 / [99, 60]) / 3) * 0.1}

//---- f0 ; https://twitter.com/redFrik/status/1395519538008141835
{ar(LPF,tanh(sin(d=ar(HPF,ar(MantissaMask,c=ar(b=Duty,4e-3,0,Dseries(1,[1,2],i=inf)%ar(b,8.192,0,Dseq((1..6)*75,i)))),5))+ar(a=SinOscFB,63,(f=ar(a,_).max).(0.8),d)/9+ar(a,[250,200]*ar(b,4.096,0,Dseq([4,6,5,5,5,5,3]/4,i)).lag,f.(0.08),f.(1/[99,60])/3))/2,1e4)*0.1}

//---- calculations
(1..6) == (6.iota + 1)
