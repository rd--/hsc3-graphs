-- bHiPass
let i = pinkNoiseId 'α' ar
    f = mouseX kr 10 20000 Exponential 0.2
    rq = mouseY kr 0 1 Linear 0.2
in bHiPass i f rq * 0.05
