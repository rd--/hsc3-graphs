-- tGrains ; mouse control ; requires=buf
let b = control KR "buf" 0
    tRate = mouseY KR 2 200 Exponential 0.1
    ctr = mouseX KR 0 (bufDur KR 0) Linear 0.1
    tr = impulse AR tRate 0
in tGrains 2 tr b 1 ctr (4 / tRate) 0 0.25 2
