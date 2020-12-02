-- brownNoise ; KR rate noise as frequency control
let n = brownNoise 'α' KR
in sinOsc AR (linExp n (-1) 1 64 9600) 0 * 0.1
