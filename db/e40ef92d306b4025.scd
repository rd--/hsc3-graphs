// MiClouds ; using external grain trigger
{arg buf = 0;
 var nc = 2;
 var input = PlayBuf.ar(nc, buf, 1, loop: 1);
 var dens = 0.5;
 var trig = Dust.kr(10);
 MiClouds.ar(input, -5, 0, 0.2, dens, 0.5, trig: trig, drywet: 1, mode: 0)}
