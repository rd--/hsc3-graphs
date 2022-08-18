// random panning sines (jmcc) #4
{
    var n = 8;
    {
        Pan2.ar(
            SinOsc.ar(80 + 2000.0.linrand, 0),
            LFNoise1.kr(0.4 + 0.8.rand),
            LFNoise1.kr(0.4 + 0.8.rand) * 0.4 + 0.5
        )
    }.dup(n).sum * (0.4 / n);
}.xfade(8, 8)
