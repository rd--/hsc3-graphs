-- formant ; modulate width frequency, other frequencies stay constant
let bw = xLine kr 800 8000 8 RemoveSynth
in formant ar 400 2000 bw * 0.1
