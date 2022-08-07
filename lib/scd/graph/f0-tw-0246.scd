// https://sccode.org/1-4Qy ; f0 ; 0246
var b = 1.to(9) * 1.5;
var d = [2 / b, 3 / b];
var e = LFPulse.ar(d, 0, 0.5);
CombC.ar(DynRingzBank.ar(e, (LFPulse.ar(1 / b, 0, 0.5) * b + 50).midiCps, 0.0002, b / 9), 2, 2 - LPF.ar(e, 50), 1)

//---- calculations
var b = 1.to(9) * 1.5; ([2, 3] /.t b) == [2 / b, 3 / b]

//----tweet0246
a=LFPulse;CombC.ar(DynKlank.ar(`[midicps(a.ar(1/b=(1..9)*1.5)*b+50),2e-4,b/9],e=a.ar(d=[2,3]/.t b)),2,2-LPF.ar(e,50))
