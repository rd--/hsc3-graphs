-- bpf
let f = fSinOsc KR (xLine KR 0.7 300 20 RemoveSynth) 0 * 3600 + 4000
in bpf (saw AR 200 * 0.5) f 0.3
