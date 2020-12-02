-- sinOsc ; Modulate phase
let ph = sinOsc AR (xLine KR 20 8000 10 RemoveSynth) 0 * 2 * pi
in sinOsc AR 800 ph * 0.1
