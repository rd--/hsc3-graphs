-- sinOsc ; Modulate phase
let ph = sinOsc ar (xLine kr 20 8000 10 RemoveSynth) 0 * 2 * pi
in sinOsc ar 800 ph * 0.1
