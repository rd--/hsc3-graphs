-- sos
let b1 = mouseY kr 1.45 1.998 Linear 0.2
    b2 = mouseX kr (-0.999) (-0.9998) Linear 0.2
in sos (impulse ar 2 0) 0.0 0.05 0.0 b1 b2
