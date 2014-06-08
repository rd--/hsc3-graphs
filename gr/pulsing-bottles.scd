// pulsing bottles (jmcc) #2

play({
    var n = 6; /* number of 'bottles' */
    Mix.arFill(n, {
        Pan2.ar(
            Resonz.ar(
                WhiteNoise.ar(
                    LFPulse.kr(4 + 10.0.rand, 0, 0.7.rand, 0.8/n)
                ),
                400 + 7000.0.linrand,
                0.01
            ),
            SinOsc.kr(0.1 + 0.4.rand, 2pi.rand)
        )
    })
})
