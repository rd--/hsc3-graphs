-- sinOsc ; phase input only
let ph = sinOsc ar (xLine kr 20 8000 10 RemoveSynth) 0 * pi
in sinOsc ar 0 ph * 0.1
