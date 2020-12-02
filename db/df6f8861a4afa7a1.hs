-- quadC
let x = mouseX KR 3.5441 4 Linear 0.1
    f = quadC AR 4 (negate x) x 0 0.1 * 800 + 900
in sinOsc AR f 0 * 0.1
