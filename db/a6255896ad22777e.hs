-- blip ; modulate frequency
let f = xLine kr 20000 200 6 RemoveSynth in blip ar f 100 * 0.1
