-- runningMax ; follow a sine lfo, reset rate controlled by mouse x
let t = impulse KR (mouseX KR 0.01 2 Linear 0.1) 0
    f = runningMax (sinOsc KR 0.2 0) t * 500 + 200
in t + sinOsc AR f 0 * 0.2