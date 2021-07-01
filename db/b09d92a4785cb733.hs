-- pauseSelfWhenDone
let x = mouseX kr (-1) 1 Linear 0.1
    e = linen x 1 0.1 1 DoNothing
    o = sinOsc ar 440 0 * e
in mrg [o,pauseSelfWhenDone e]
