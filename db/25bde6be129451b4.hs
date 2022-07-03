-- calculate coefficients and use sos ; warning=feedback
let i = soundIn (mce2 0 1)
    f = mouseX kr 800 1200 Exponential 0.2
    bw = mouseY kr 0 10 Linear 0.2
    (a0, a1, a2, b1, b2) = Sound.Sc3.Common.Math.Filter.Beq.bBandStopCoef sampleRate f bw
in sos i a0 a1 a2 b1 b2
