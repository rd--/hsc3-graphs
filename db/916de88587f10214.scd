// random panning sines (jmcc) #4
{RTexture.xfadeGraph({
    arg tr;
    var n = 8;
    Mix.ar(Array.fill(n, {
        Pan2.ar(
            FSinOsc.ar(80 + TRand.kr(0,2000,tr)), // linrand
            LFNoise1.kr(0.4 + TRand.kr(0,0.8,tr)),
            LFNoise1.kr(0.4 + TRand.kr(0,0.8,tr), 0.4, 0.5)
        )
        })) * (0.4 / n);
},8,8)}
