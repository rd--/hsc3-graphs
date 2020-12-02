-- localIn ; ping pong ; warning=feedback
let z = soundIn 0
    a1 = localIn 2 AR 0 + mce [z,0]
    a2 = delayN a1 0.2 0.2
    a3 = mceEdit reverse a2 * 0.8
in mrg [z + a2,localOut a3]
