-- rsvfhp
let f = sinOsc KR (xLine KR 0.7 300 20 RemoveSynth) 0 * 3600 + 4000
in X.rsvfhp (saw AR 200 * 0.1) f (control KR "q" 1)
