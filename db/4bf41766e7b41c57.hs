-- MiOmi ; external FM
let fmfreq = mouseX KR 2 1000 Linear 0.2
    fmamp = mouseY KR 0 1 Linear 0.2
    extFM = sinOsc AR fmfreq 0 * fmamp
in X.miOmi AR extFM 0 {-pit-} 40 0.2 0.25 0.5 0.5 0.5 0.5 {-fm1-} 0.5 {-fm2-} 0.5 0 {-xfb-} 0.1 0 {-cutoff-} 0.9 0 0.5 0.5 0.2 0.5 * 0.5
