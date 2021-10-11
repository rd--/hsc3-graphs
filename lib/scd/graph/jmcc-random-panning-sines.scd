// random panning sines (jmcc) #4
RTexture.overlapGraph({
    arg tr;
    var n = 8;
    Mix.fill(n, {
        Pan2.ar(
            FSinOsc.ar(80 + TRand.kr(0, 2000, tr), 0), // linrand
            LFNoise1.kr(0.4 + TRand.kr(0, 0.8, tr)),
            LFNoise1.kr(0.4 + TRand.kr(0, 0.8, tr)) * 0.4 + 0.5)
    }) * 0.1 / n
}, 8, 8, 2)
