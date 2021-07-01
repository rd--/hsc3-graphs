-- linExp
let f = linExp (mouseX kr 0 1 Linear 0.2) 0 1 440 660
in sinOsc ar f 0 * 0.1
