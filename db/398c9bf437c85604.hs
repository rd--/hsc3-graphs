-- fSinOsc ; loses amplitude towards the end
let f = fSinOsc AR (xLine KR 4 401 8 RemoveSynth)
in fSinOsc AR (f 0 * 200 + 800) 0 * 0.1
