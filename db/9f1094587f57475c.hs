-- midEQ
let f = midiCPS (fSinOsc KR 1 0 * 24 + 84)
in midEQ (saw AR 200 * 0.05) f 0.3 12
