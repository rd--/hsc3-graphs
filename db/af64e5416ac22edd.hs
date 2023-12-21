-- bPeakEQ ; calculate coefficients and use sos (see also bLowPass4)
let i = pinkNoiseId 'α' ar * 0.1
    freq = mouseX kr 2200 18000 Exponential 0.2
    rq = mouseY kr 10 0.4 Linear 0.2
    (a0, a1, a2, b1, b2) = Sound.Sc3.Common.Math.Filter.Beq.bPeakEqCoef sampleRate freq rq 6
in sos i a0 a1 a2 b1 b2 * 0.5
