-- bHiShelf ; calculate coefficients and use sos ; warning=feedback
let i = soundIn 0
    f = mouseX kr 2200 18000 Exponential 0.2
    rs = mouseY kr 0.1 1 Linear 0.2
    (a0, a1, a2, b1, b2) = Sound.Sc3.Common.Math.Filter.Beq.bHiShelfCoef sampleRate f rs 6
in sos i a0 a1 a2 b1 b2
