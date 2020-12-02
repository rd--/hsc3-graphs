-- zeroCrossing
let a = sinOsc AR (sinOsc KR 1 0 * 600 + 700) 0 * 0.1
in mce [a, impulse AR (zeroCrossing a) 0 * 0.25]
