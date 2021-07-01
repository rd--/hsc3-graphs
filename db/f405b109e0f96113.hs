-- zeroCrossing
let a = soundIn 0
in mce [a, sinOsc ar (zeroCrossing a) 0 * 0.1]
