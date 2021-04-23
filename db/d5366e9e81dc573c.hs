-- miElements ; blow ; contour
let gat = lfPulse KR 1 0.01 0.5
    pit = sinOsc KR 5 0 * 0.1 + 53
    cont = sinOsc KR 0.8 0 `in_range` (0,1)
    flow = lfNoise1 'α' KR 0.1 `in_range` (0,1)
in X.miElements AR 0 0 gat pit 0.5 cont 0 0.5 0 flow 0.5 0.5 0.3 0.5 0.25 0.3 0.8 0.2 0.3 0 0 * 0.25
