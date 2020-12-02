// MiOmi ; external FM
{var fmfreq = MouseX.kr(2, 1000);
 var fmamp = MouseY.kr(0, 1);
 var extFM = SinOsc.ar(fmfreq,0,fmamp);
 MiOmi.ar(extFM, pit: 40, fm1: 0.5, fm2: 0.5, xfb: 0.1, cutoff: 0.9)}
