-- grainFM ; mouse control
let n1 = whiteNoise 'α' KR
    n2 = lfNoise1 'β' KR 500
    x = mouseX KR (-0.5) 0.5 Linear 0.1
    y = mouseY KR 0 400 Linear 0.1
    f = n1 * y + 440
    t = impulse KR 12.5 0
    i = linLin n2 (-1) 1 1 10
in grainFM 2 t 0.1 f 200 i x (-1) 512 * 0.1
