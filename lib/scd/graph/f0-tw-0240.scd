// https://sccode.org/1-4Qy ; f0 ; 0240
var l = " #SuperCollider ".ascii.pyramid(6);
var d = Pulse.ar(Duty.ar(1 / [10, 4], 0, Dseq.dr(l.midiCps, 99)).mean, 0.5);
Pan2.ar(CombN.ar(BLowPass4.ar(d, 1200, 1), 1, 1, 8) / 2, d, 1) / 2

//---- calculations
" #SuperCollider ".ascii.midiCps.pyramid(6).size == 256

//----tweet0240
Pan2.ar(CombN.ar(BLowPass4.ar(d=Pulse.ar(Duty.ar(1/[10,4],0,Dseq(" #SuperCollider ".ascii.midicps.pyramid(6),99)).mean)),1,1,8)/2,d)/2
