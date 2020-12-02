-- calculate coefficients and use sos ; warning=feedback
let i = soundIn (mce2 0 1)
    f = mouseX KR 800 1200 Exponential 0.2
    bw = mouseY KR 0 10 Linear 0.2
    (a0, a1, a2, b1, b2) = Sound.SC3.Common.Math.Filter.BEQ.bBandStopCoef sampleRate f bw
in sos i a0 a1 a2 b1 b2
