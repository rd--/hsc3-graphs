-- miElements ; easteregg: 2x2-op FM synth
let n = lfNoise1 'α' KR 0.3 * 0.5 + 0.5
    (r1,r2,r3) = (0.25,0.25,0.51)
in X.miElements AR 0 0 {-gate-} 1 48 {-strength-} 0.9 {-contour-} 0.5 {-bow_level-} r1 {-blow_level-} 0.6 {-strike_level-} 0.5 {-flow-} r2 {-mallet-} r3 {-bow_timb-} n {-blow_timb-} 0.3 {-strike_timb-} 0.6  {-geom-} 0.12 {-bright-} 0.6 {-damp-} 0.5 0.2 {-space-} 0.7 0 {-easteregg-} 1
