-- mouseX ; frequency control
let x = mouseX kr 40 10000 Exponential 0.2
in sinOsc ar x 0 * 0.1
