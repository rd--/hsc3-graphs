-- linen ; PauseSynth done action
let x = mouseX KR (-1) 1 Linear 0.1
    e = linen x 1 0.1 1 PauseSynth
in sinOsc AR 440 0 * e
