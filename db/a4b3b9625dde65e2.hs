-- runningMax ; follow a sine lfo, reset rate controlled by mouse x
let t = impulse kr (mouseX kr 0.01 2 Linear 0.1) 0
    f = runningMax (sinOsc kr 0.2 0) t * 500 + 200
in t + sinOsc ar f 0 * 0.2
