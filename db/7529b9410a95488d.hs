-- linLin ; linLin is a function for writing a MulAdd UGen.
let f = linLin (mouseX kr 0 1 Linear 0.2) 0 1 440 660
in sinOsc ar f 0 * 0.1
