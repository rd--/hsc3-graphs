-- sweep ; line segments, set start & end values, transition time and trigger, stops at end time
let tr = tr_control "tr" 1
    st = control KR "st" 440
    en = control KR "en" 880
    tm = control KR "tm" 2
    rt = ((en - st) / tm)
    sw = gate (sweep tr rt + st) (trig tr tm)
in sinOsc AR sw 0 * 0.2
