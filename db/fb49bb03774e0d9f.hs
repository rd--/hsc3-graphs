-- lag ; mouse
let x = mouseX KR 220 440 Linear 0.2
in sinOsc AR (mce [x, lag x 1]) 0 * 0.1
