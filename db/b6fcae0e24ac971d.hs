-- lastValue
let x = mouseX kr 100 400 Linear 0.1
in sinOsc ar (lastValue x 40) 0 * 0.1
