-- blitB3 ; sawtooth
let x = mouseX kr 20 1000 Exponential 0.2
in leakDC (integrator (X.blitB3 ar x * 0.2) 0.99) 0.995
