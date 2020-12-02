-- dpw3Tri ; c.f. pulse
let f = mouseX KR 440 8800 Exponential 0.2
in mce2 (X.dpw3Tri AR f) (pulse AR f 0.5) * 0.05
