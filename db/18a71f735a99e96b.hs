-- lag2 ; control
let x = mouseX kr 220 440 Exponential 0.1
in sinOsc ar (mce [x, lag2 x 1]) 0 * 0.1
