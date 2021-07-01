-- blitB3Saw ; aliasing suddenly appears for very high frequencies
let f = mouseX kr 10 10000 Exponential 0.2
    c = mouseY kr 0.01 0.99 Linear 0.2
in X.blitB3Saw ar f c * 0.1
