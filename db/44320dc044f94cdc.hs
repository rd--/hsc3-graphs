-- lfClipNoise ; use as frequency control
let n = lfClipNoise 'α' KR 4
in sinOsc AR (n * 200 + 600) 0 * 0.1
