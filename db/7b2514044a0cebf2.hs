-- blitB3 ; sawtooth, super-saw, can integrate, accumulates DC
let x = mouseX KR 1 4 Linear 0.2
in mix (leakDC (integrator (X.blitB3 AR (x * mce [220,221,223,224]) * 0.125) 0.99) 0.995)
