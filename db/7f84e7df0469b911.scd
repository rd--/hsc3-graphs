// BLowPass4 ; rq should compensate for 2 biquad sections
BLowPass4.ar(
        WhiteNoise.ar(),
        MouseX.kr(10, 20000, 1, 0.2),
        MouseY.kr(0.1, 1, 0, 0.2)
) * 0.25
