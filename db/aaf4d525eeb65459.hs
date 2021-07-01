-- localOut ; ping pong
let n = decay (impulse ar 0.3 0) 0.1 * whiteNoiseId 'α' ar * 0.2
    l = localIn 2 ar 0 + mce2 n 0
    d = delayN l 0.2 0.2
    o = localOut (mceReverse d * 0.8)
in mrg2 d o
