-- lagUD ; lag pitch, slower down (5 seconds) than up (1 second)
let x = mouseX kr 220 440 Linear 0.2
in sinOsc ar (mce2 x (lagUD x 1 5)) 0 * 0.1
