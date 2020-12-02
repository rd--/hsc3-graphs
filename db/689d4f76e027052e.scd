// MiOmi ; filter and cutoff modulation
{var filtmod = LFTri.kr(0.23).range(0,1);
 var gate = LFPulse.kr(6,0,0.2);
 var cf = LFTri.kr(0.2).range(0,0.5);
 MiOmi.ar(0, gate, pit: 48, contour: 0.1, fm1: 0.5, fm2: 0.5, fb:0.5, strength: 0, filter_mode: filtmod, cutoff: cf, env: 0.5)}
