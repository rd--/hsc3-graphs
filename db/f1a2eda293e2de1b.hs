-- dpw3Tri ; c.f. pulse
let f = mouseX kr 440 8800 Exponential 0.2
in mce2 (X.dpw3Tri ar f) (pulse ar f 0.5) * 0.05
