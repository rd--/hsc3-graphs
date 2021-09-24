-- midEQ
let f = midiCps (fSinOsc kr 1 0 * 24 + 84)
in midEQ (saw ar 200 * 0.05) f 0.3 12
