-- zeroCrossing
let a = soundIn 0
in mce [a, sinOsc AR (zeroCrossing a) 0 * 0.1]
