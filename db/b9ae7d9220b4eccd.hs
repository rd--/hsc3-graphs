-- lag3 ; mouse control
let x = mouseX KR 220 440 Exponential 0.1
in sinOsc AR (mce [x, lag3 x 1]) 0 * 0.1
