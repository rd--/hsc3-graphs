-- linen ; PauseSynth done action
let x = mouseX kr (-1) 1 Linear 0.1
    e = linen x 1 0.1 1 PauseSynth
in sinOsc ar 440 0 * e
