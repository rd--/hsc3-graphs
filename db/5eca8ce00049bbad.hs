-- pluck ; excitation signal is white noise, triggered twice a second with varying OnePole coef
let n = whiteNoiseId 'α' ar
    t = impulse kr 9 0
    x = mouseX kr (-0.999) 0.999 Linear 0.1
    y = mouseY kr 0.1 1 Linear 0.1
    dl = 1 / 440
in pluck (n * 0.25) t dl (dl * y) 10 x
