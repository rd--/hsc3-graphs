-- rmeq ; rapid param changes fail at low frequencies
let freq = mouseX kr 55 3520 Exponential 0.2
    rq = mouseY kr 0.01 2.0 Linear 0.2
    k = 3
in X.rmeq (pinkNoiseId 'α' ar * 0.1) freq rq k
