-- blitB3Tri ; aliasing higher frequencies (over 5000Hz or so) is very beautiful in point scope
let x = mouseX KR 20 8000 Exponential 0.2
    y = mouseY KR 0.001 0.99 Linear 0.2
in X.blitB3Tri AR x 0.99 y * 0.1
