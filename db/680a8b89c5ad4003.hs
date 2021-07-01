-- grainFM ; mouse control
let n1 = whiteNoiseId 'α' kr
    n2 = lfNoise1Id 'β' kr 500
    x = mouseX kr (-0.5) 0.5 Linear 0.1
    y = mouseY kr 0 400 Linear 0.1
    f = n1 * y + 440
    t = impulse kr 12.5 0
    i = linLin n2 (-1) 1 1 10
in grainFM 2 t 0.1 f 200 i x (-1) 512 * 0.1
