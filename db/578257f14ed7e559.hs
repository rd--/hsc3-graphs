-- lastValue ; difference between currrent and the last changed
let x = mouseX KR 0.1 4 Linear 0.1
    f = abs (lastValue x 0.5 - x) * 400 + 200
in sinOsc AR f 0 * 0.2
