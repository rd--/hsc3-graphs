// MiRipples ; filter sweep + distortion
{var cf = LFTri.kr(0.03).range(0.1,0.9);
MiRipples.ar(Saw.ar(40), cf, 0.8, 4, 0.2)}
