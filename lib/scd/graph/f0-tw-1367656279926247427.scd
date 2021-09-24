// f0 <https://twitter.com/redFrik/status/1367656279926247427>
{var b = #[20, 15, 18, 19, 4, 1, 7, 11, 22, -125, -188, 12, 12]
;var f = {arg x, y; SinOsc.ar(x, y ? b).round}
;var t = SinOsc.ar(f.value(0.01, 0) + 10, b)
;var c = GrainSin.ar(1, t, 0.85, f.value(0.4, nil) + f.value(0.1, nil) + 2 ** f.value(1 / b, nil) + 1 * 99, 0, -1, 512) / 5
;var x = HPF.ar(SinOsc.ar(2, c * pi) + (PitchShift.ar(c, 0.5, f.value(1, nil) * f.value(0.1, nil) + 2, 0.05, 1) * 0.15), 5)
;var y = SinOsc.ar(50, 0) * HPF.ar(f.value(1, #[0, 1]), 1) / 2
;Splay.ar(x + y).tanh}

//---- f0 <https://twitter.com/redFrik/status/1367656279926247427>
{f={|x,y|ar(a,x,y?b).round};ar(Splay,c=ar(GrainSin,1,ar(a=SinOsc,f.(0.01,0)+10,b='TORSDAGKVÄLL'.ascii-64),0.85,f.(0.4)+f.(0.1)+2**f.(1/b)+1*99)/5;ar(HPF,ar(a,2,c*pi)+ar(PitchShift,c,0.5,f.(1)*f.(0.1)+2,0.05,1,0.15),5)+ar(a,50,0,ar(HPF,f.(1,[0,1]),1)/2)).tanh}

//----- calculations
'TORSDAGKVÄLL'.ascii - 64 == [20, 15, 18, 19, 4, 1, 7, 11, 22, -125, -188, 12, 12]