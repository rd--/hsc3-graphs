-- pauseSelf
let x = mouseX kr (-1) 1 Linear 0.1
    o = sinOsc ar 440 0 * 0.1
in mrg [o,pauseSelf x]
