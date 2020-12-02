-- pluck ; excitation signal is white noise, triggered twice a second with varying OnePole coef
let n = whiteNoise 'α' AR
    t = impulse KR 9 0
    x = mouseX KR (-0.999) 0.999 Linear 0.1
    y = mouseY KR 0.1 1 Linear 0.1
    dl = 1 / 440
in pluck (n * 0.25) t dl (dl * y) 10 x
