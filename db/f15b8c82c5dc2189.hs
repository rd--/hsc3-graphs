-- bHiPass
let i = pinkNoise 'α' AR
    f = mouseX KR 10 20000 Exponential 0.2
    rq = mouseY KR 0 1 Linear 0.2
in bHiPass i f rq * 0.05
