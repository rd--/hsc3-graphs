-- onsets ; x varies threshold ; detector triggers new random oscillator frequency
let x = mouseX kr 0 1 Linear 0.2
    i = mix (soundIn (mce2 0 1))
    c = fft' (localBufId 'γ' 1 512) i
    o = onsetsDefault c x (onsetType "rcomplex")
in sinOsc ar (midiCPS (tiRandId 'a' 40 72 o)) 0 * 0.1
