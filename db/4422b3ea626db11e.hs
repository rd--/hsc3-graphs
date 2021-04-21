-- bPeakEQ ; calculate coefficients and use sos (see also bLowPass4)
let i = pinkNoise 'α' AR * 0.1
    freq = mouseX KR 2200 18000 Exponential 0.2
    rq = mouseY KR 10 0.4 Linear 0.2
    (a0, a1, a2, b1, b2) = Sound.SC3.Common.Math.Filter.BEQ.bPeakEQCoef sampleRate freq rq 6
in sos i a0 a1 a2 b1 b2 * 0.5
