-- brownNoise ; kr rate noise as frequency control
let n = brownNoiseId 'α' kr
in sinOsc ar (linExp n (-1) 1 64 9600) 0 * 0.1
