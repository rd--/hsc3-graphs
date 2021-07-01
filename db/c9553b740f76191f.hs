-- lfClipNoise ; use as frequency control
let n = lfClipNoiseId 'α' kr 4
in sinOsc ar (n * 200 + 600) 0 * 0.1
