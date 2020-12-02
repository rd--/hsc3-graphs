-- bAllPass ; calculate coefficients and use sos ; warning=feedback
let i = soundIn (mce2 0 1) * 0.5
    f = mouseX KR 100 18000 Exponential 0.2
    (a0, a1, a2, b1, b2) = Sound.SC3.Common.Math.Filter.BEQ.bAllPassCoef sampleRate f 0.8
in sos i a0 a1 a2 b1 b2 + negate i
