-- tGrains ; mouse control ; requires=buf
let b = control KR "buf" 0
    rt = mouseY KR 8 120 Exponential 0.1
    dur = 4 / rt
    clk = dust 'α' AR rt
    r = tRand 'β' 0 0.01 clk
    pan = whiteNoise 'γ' KR * 0.6
    x = mouseX KR 0 (bufDur KR b) Linear 0.1
    pos = x + r
in tGrains 2 clk b 1 pos dur pan 0.25 2
