// MiClouds ; spectral mode (this mode causes high CPU peaks)
{arg buf = 0;
 var nc = 2;
 var input = PlayBuf.ar(nc, buf, 1, loop: 1);
 var size = 0.35;
 var dens = 0.02;
 var tex = 0.3;
 MiClouds.ar(input, 0, 0, size, dens, tex, drywet: 1, rvb: 0.8, fb: 0.8, mode: 3) * 0.35}
