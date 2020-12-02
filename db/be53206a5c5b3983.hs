-- blip ; modulate number of harmonics
let nh = line KR 1 100 20 RemoveSynth in blip AR 200 nh * 0.2
