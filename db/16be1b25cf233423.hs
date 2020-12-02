-- grainBuf ; requires=buf
let b = control KR "buf" 0
    e = -1
    x = mouseX KR (-1) 1 Linear 0.1
    y = mouseY KR 10 45 Linear 0.1
    i = impulse KR y 0
    n1 = lfNoise1 'α' KR 500
    n2 = lfNoise2 'β' KR 0.1
    r = linLin n1 (-1) 1 0.5 2
    p = linLin n2 (-1) 1 0 1
in grainBuf 2 i 0.1 b r p 2 x e 512 * 0.25