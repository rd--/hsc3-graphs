-- rBezier
let x = mouseX KR 40 4000 Exponential 0.2
    y = mouseY KR 0.1 0.2 Linear 0.2
in X.rBezier AR x 0 (mce [0,0,y,-1.3,0.3,-1.3,0.5,0,0.7,1.3,0.8,1.3,1,0]) * 0.1
