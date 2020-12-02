-- lag ; noise
let n = lfNoise0 'α' KR 0.5
in sinOsc AR (220 + (lag n 1 * 220)) 0 * (lag n 2 * 0.1)
