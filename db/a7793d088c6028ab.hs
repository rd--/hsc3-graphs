-- rhpf
let c = rhpf (lfSaw kr 2 0) (sinOsc kr (xLine kr 0.7 30 20 RemoveSynth) 0 * 35 + 40) 0.05
in sinOsc ar (c * 200 + 500) 0 * 0.25
