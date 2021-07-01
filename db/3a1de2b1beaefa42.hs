-- lag ; mouse
let x = mouseX kr 220 440 Linear 0.2
in sinOsc ar (mce [x, lag x 1]) 0 * 0.1
