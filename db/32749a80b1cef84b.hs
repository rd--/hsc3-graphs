-- blitB3Tri ; aliasing at higher frequencies (over 5000Hz or so) is very beautiful in point scope
let x = mouseX kr 20 8000 Exponential 0.2
    y = mouseY kr 0.001 0.99 Linear 0.2
    z = X.blitB3Tri ar x 0.99 y * 0.1
in mce2 z (delayN z 0.2 (sampleDur * control_m kr "sampleDelay" 12 (0,64,"lin")))
