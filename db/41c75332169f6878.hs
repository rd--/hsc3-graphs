-- stepper ; mouse button press increments integer frequency multiplier
let tr = trig1 (mouseButton kr 0 1 0) controlDur
    fr = 55 * stepper tr 0 1 17 1 1
in sinOsc ar fr 0 * 0.1
