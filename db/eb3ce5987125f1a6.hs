-- lfNoise2 ; as frequency control
let f = lfNoise2 'α' KR 4
in sinOsc AR (f * 400 + 450) 0 * 0.1
