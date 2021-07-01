-- rhpf
let f = fSinOsc kr (xLine kr 0.7 300 20 RemoveSynth) 0 * 3600 + 4000
in rhpf (saw ar 200 * 0.1) f 0.2
