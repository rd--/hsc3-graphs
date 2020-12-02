-- phasor ; as impulse with reset
let impulse_reset freq reset =
        let ph = phasor AR reset (freq / sampleRate) 0 1 0
        in hpz1 ph <** 0
    x = mouseX KR 0 1 Linear 0.2 >** 0.5
    ck = impulse AR 3 0
    im = impulse_reset 3 x
    x' = sinOsc AR 440 0 * x * 0.05
    im' = sinOsc AR 220 0 * decay2 (ck + im) 0.01 0.5 * 0.1
in mce2 x' im'
