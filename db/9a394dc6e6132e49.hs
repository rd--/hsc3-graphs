-- bLowPass ; warning=feedback
let i = soundIn (mce2 0 1)
    f = mouseX kr 10 20000 Exponential 0.2
    rq = mouseY kr 0 1 Linear 0.2
in bLowPass i f rq
