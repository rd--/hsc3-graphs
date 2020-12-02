// MiClouds ; more spectral stuff ; watch volume
{arg buf = 0;
 var nc = 2;
 var input = PlayBuf.ar(nc, buf, 1, loop: 1);
 var size = LFNoise1.kr(0.2).range(0.1,0.5).squared;
 var dens = LFNoise1.kr(0.3,0.5,0.5);
 var tex = LFNoise1.kr(0.3,0.5,0.5);
 MiClouds.ar(input, 0, 0, size, dens, tex, drywet: 1, rvb: 0.6, fb: 0.6, lofi: 1, mode: 3) * 0.25}
