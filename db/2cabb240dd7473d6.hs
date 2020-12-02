-- lfNoise1 ; as frequency control
let n = lfNoise1 'α' KR 4
    f = n * 400 + 450
in sinOsc AR f 0 * 0.1
