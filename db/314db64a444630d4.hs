-- rhpf
let c = rhpf (lfSaw KR 2 0) (sinOsc KR (xLine KR 0.7 30 20 RemoveSynth) 0 * 35 + 40) 0.05
in sinOsc AR (c * 200 + 500) 0 * 0.25
