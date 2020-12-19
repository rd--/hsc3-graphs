-- phasor ; control two sine frequencies, mouse y controls resetPos of the second
let rate = mouseX KR 1 200 Linear 0.1
    tr = impulse AR rate 0
    sr = sampleRate
    x = phasor AR tr (rate / sr) 0 1 (mce2 0 (mouseY KR 0 1 Linear 0.2))
in sinOsc AR (x * 500 + 500) 0 * 0.1
