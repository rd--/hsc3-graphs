-- blitB3Square ; aliasing at high frequencies
let f = mouseX KR 20 10000 Exponential 0.2
    c = mouseY KR 0.001 0.999 Linear 0.2
in X.blitB3Square AR f c * 0.1
