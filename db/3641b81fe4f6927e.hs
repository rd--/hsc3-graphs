-- rsvfhp
let f = sinOsc kr (xLine kr 0.7 300 20 RemoveSynth) 0 * 3600 + 4000
in X.rsvfhp (saw ar 200 * 0.1) f (control kr "q" 1)
