-- dfm1 ; mouse control
let n = pinkNoiseId 'α' ar * 0.5
    x = mouseX kr 80 5000 Exponential 0.1
    y = mouseY kr 0.1 1.2 Linear 0.1
in X.dfm1 n x y 1 0 3e-4
