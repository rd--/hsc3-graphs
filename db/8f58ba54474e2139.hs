-- phasor ; control two sine frequencies, mouse y controls resetPos of the second
let rate = mouseX kr 1 200 Linear 0.1
    tr = impulse ar rate 0
    sr = sampleRate
    x = phasor ar tr (rate / sr) 0 1 (mce2 0 (mouseY kr 0 1 Linear 0.2))
in sinOsc ar (x * 500 + 500) 0 * 0.1
