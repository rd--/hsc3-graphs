-- blip ; modulate number of harmonics
let nh = line kr 1 100 20 RemoveSynth in blip ar 200 nh * 0.2
