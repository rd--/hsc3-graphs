-- blitB3 ; sawtooth
let x = mouseX KR 20 1000 Exponential 0.2
in leakDC (integrator (X.blitB3 AR x * 0.2) 0.99) 0.995
