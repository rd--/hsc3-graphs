-- pauseSelf
let x = mouseX KR (-1) 1 Linear 0.1
    o = sinOsc AR 440 0 * 0.1
in mrg [o,pauseSelf x]
