-- bezier
let x = mouseX kr 40 4000 Exponential 0.2
in X.bezier ar 100 0.0001 x 0 (mce [0,0,0.2,-1.3,0.3,-1.3,0.5,0,0.7,1.3,0.8,1.3,1,0]) * 0.1
