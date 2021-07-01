-- metro
let b = xLine kr 60 120 5 DoNothing
    m = X.metro kr b 1
    o = sinOsc ar 440 0 * 0.1
in decay m 0.2 * o
