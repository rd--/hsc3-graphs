-- control ; contructor with control index input ; this will fail if n /= 1 (ie. 0 or 2)
let n = 1
    f = control_f64 KR (Just 0) "freq" 440
    a = control_f64 KR (Just n) "amp" 0.1
    p = control_f64 KR Nothing "phase" 0
in sinOsc AR f p * a
