-- miElements ; ringing ; use the 'strike' input (which bypasses the exciter section)
let inp = pinkNoise 'α' AR * 0.3
in X.miElements AR 0 {-strike_in-} inp 0 48 0.5 0.2 0 0 0 0.5 0.5 0.5 0.5 0.5 0.25 0.5 0.7 0.2 0.3 0 0
