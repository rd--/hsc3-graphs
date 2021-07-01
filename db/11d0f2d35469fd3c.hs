-- lastValue ; difference between currrent and the last changed
let x = mouseX kr 0.1 4 Linear 0.1
    f = abs (lastValue x 0.5 - x) * 400 + 200
in sinOsc ar f 0 * 0.2
