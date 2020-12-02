-- metro
let b = xLine KR 60 120 5 DoNothing
    m = X.metro KR b 1
    o = sinOsc AR 440 0 * 0.1
in decay m 0.2 * o
