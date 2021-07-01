-- roundUp
let x = mouseX kr 60 4000 Linear 0.1
    f = roundUp x 100
in sinOsc ar f 0 * 0.1
