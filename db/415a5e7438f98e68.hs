-- sweep ; line segments, set start & end values, transition time and trigger, stops at end time
let tr = trigControl "tr" 1
    st = control kr "st" 440
    en = control kr "en" 880
    tm = control kr "tm" 2
    rt = ((en - st) / tm)
    sw = gate (sweep tr rt + st) (trig tr tm)
in sinOsc ar sw 0 * 0.2
