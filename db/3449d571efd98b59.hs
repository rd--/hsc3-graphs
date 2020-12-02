-- dfm1 ; mouse control
let n = pinkNoise 'α' AR * 0.5
    x = mouseX KR 80 5000 Exponential 0.1
    y = mouseY KR 0.1 1.2 Linear 0.1
in X.dfm1 n x y 1 0 3e-4
