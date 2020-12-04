-- delayN ; flanging ; warning=feedback
let f = 0.1 -- flanger freq
    g = 0.1 -- feedback
    i = soundIn (mce2 0 1) -- two channels of input signal
    fb = i + localIn 2 AR 0 -- add feedback
    e = delayN fb 0.02 (sinOsc KR f 0 * 0.005 + 0.005) -- max delay of 20msec
    lp_f x = bpf x (mouseX KR 1000 10000 Linear 0.2) 0.1 -- filter in the feedback loop
    o = localOut (lp_f e * g)
in mrg2 (i + e) o
