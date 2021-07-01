-- lag ; noise
let n = lfNoise0Id 'α' kr 0.5
in sinOsc ar (220 + (lag n 1 * 220)) 0 * (lag n 2 * 0.1)
