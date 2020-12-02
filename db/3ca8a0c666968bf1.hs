-- formant ; modulate width frequency, other frequencies stay constant
let bw = xLine KR 800 8000 8 RemoveSynth
in formant AR 400 2000 bw * 0.1
