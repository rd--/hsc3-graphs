-- ; rLagC
let x = mouseX kr 220 440 Linear 0.2
in sinOsc ar (mce2 x (X.rLagC x 1 0 5 0)) 0 * 0.1
