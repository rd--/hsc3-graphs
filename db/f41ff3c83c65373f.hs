-- blitB3Square ; aliasing at high frequencies
let f = mouseX kr 20 10000 Exponential 0.2
    c = mouseY kr 0.001 0.999 Linear 0.2
in X.blitB3Square ar f c * 0.1
