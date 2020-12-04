-- lagUD ; lag pitch, slower down (5 seconds) than up (1 second)
let x = mouseX KR 220 440 Linear 0.2
in sinOsc AR (mce2 x (lagUD x 1 5)) 0 * 0.1
