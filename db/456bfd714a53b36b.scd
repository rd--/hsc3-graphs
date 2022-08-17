// TGrains ; demand ugens as inputs ; requires=buf ; (Warning: empty sequence in Dseq - Server 'localhost' exited with exit code 0)
arg buf = 0;
var trate = MouseX.kr(1, 100, 1);
var d = { Dwhite(0.1, 0.2, 1) };
var z = { Drand([Dgeom(0.1, 1 + d.value, Diwhite(20, 40, 1)), Dgeom(1, 1 - d.value, Diwhite(20, 40, 1))], 1) };
TGrains.ar(
    numChannels: 2,
    trigger: Impulse.ar(trate),
    bufnum: buf,
    rate: Dseq([1, 1, z.value, 0.5, 0.5, 0.2, 0.1, 0.1, 0.1, 0.1], inf) * 2 + 1,
    centerPos: Dseq(z.dup(8), inf),
    dur: Dseq([1, d.value, 1, z.value, 0.5, 0.5, 0.1, z.value] * 2, inf) / trate,
    pan: Dseq([1, 1, 1, 0.5, 0.2, 0.1, 0, 0, 0], inf) * 2 - 1,
    amp: Dseq([1, 0, z.value, 0, 2, 1.0, 1, 0.1, 0.1], inf))
