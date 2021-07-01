-- fSinOsc ; loses amplitude towards the end
let f = fSinOsc ar (xLine kr 4 401 8 RemoveSynth)
in fSinOsc ar (f 0 * 200 + 800) 0 * 0.1
