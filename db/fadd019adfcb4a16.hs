-- control ; contructor with control index input ; this will fail if n /= 1 (ie. 0 or 2)
let n = 1
    f = control_f64 kr (Just 0) "freq" 440
    a = control_f64 kr (Just n) "amp" 0.1
    p = control_f64 kr Nothing "phase" 0
in sinOsc ar f p * a
