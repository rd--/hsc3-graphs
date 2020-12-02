// MiClouds ; basic granulation ; requires=buf (stereo)
{arg buf = 0;
 var nc = 2;
 var input = PlayBuf.ar(nc, buf, 1, loop: 1);
 var dens = LFNoise1.kr(0.3).range(0.3, 0.45);
 MiClouds.ar(input, 0, 0, 0, dens, 0.5, drywet: 1, mode: 0)}
