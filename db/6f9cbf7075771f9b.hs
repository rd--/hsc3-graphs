-- rmEQ ; rapid param changes fail at low frequencies
let freq = mouseX KR 55 3520 Exponential 0.2
    rq = mouseY KR 0.01 2.0 Linear 0.2
    k = 3
in X.rmeq AR (pinkNoise 'α' AR * 0.1) freq rq k
