-- runningMin ; follow a sine lfo, reset rate controlled by mouseX
let o = sinOsc KR 2 pi
    x = mouseX KR 0.01 10 Exponential 0.1
    t = impulse AR x 0
    f = runningMin o t * 500 + 200
in t + sinOsc AR f 0 * 0.1
