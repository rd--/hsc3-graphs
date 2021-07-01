-- zeroCrossing
let a = sinOsc ar (sinOsc kr 1 0 * 600 + 700) 0 * 0.1
in mce [a, impulse ar (zeroCrossing a) 0 * 0.25]
