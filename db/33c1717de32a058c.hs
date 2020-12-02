-- tGrains ; mouse control ; requires=buf
let b = control KR "buf" 0
    rt = mouseY KR 2 120 Exponential 0.1
    dur = 1.2 / rt
    clk = impulse AR rt 0
    pos = mouseX KR 0 (bufDur KR b) Linear 0.1
    n0 = whiteNoise 'α' KR
    n1 = whiteNoise 'β' KR
    rate = shiftLeft 1.2 (roundTo (n0 * 3) 1)
in tGrains 2 clk b rate pos dur (n1 * 0.6) 0.25 2
