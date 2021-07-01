-- lfNoise0 ; as frequency control
let f = lfNoise0Id 'α' kr 4
in sinOsc ar (f * 400 + 450) 0 * 0.1
