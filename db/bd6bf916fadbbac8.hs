-- bLowPass ; calculate coefficients and use sos (see also bLowPass4)
let i = mix (saw ar (mce [0.99, 1, 1.01] * 440) * 0.05)
    cf = mouseX kr 100 20000 Exponential 0.2
    rq = mouseY kr 0.1 1 Linear 0.2
    (a0, a1, a2, b1, b2) = Sound.Sc3.Common.Math.Filter.Beq.bLowPassCoef sampleRate cf rq
in sos i a0 a1 a2 b1 b2
