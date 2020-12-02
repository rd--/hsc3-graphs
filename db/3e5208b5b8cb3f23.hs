-- onsets ; x varies threshold ; detector triggers new random oscillator frequency
let x = mouseX KR 0 1 Linear 0.2
    i = mix (soundIn (mce2 0 1))
    c = fft' (localBuf 'γ' 1 512) i
    o = onsets' c x (onsetType "rcomplex")
in sinOsc AR (midiCPS (tiRand 'a' 40 72 o)) 0 * 0.1
