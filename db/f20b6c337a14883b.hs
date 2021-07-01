-- lfNoise1 ; as frequency control
let n = lfNoise1Id 'α' kr 4
    f = n * 400 + 450
in sinOsc ar f 0 * 0.1
