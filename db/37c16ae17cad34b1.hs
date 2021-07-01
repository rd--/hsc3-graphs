-- bBandStop ; warning=feedback
let i = soundIn (mce2 0 1)
    f = mouseX kr 20 20000 Exponential 0.2
    bw = mouseY kr 0 10 Linear 0.2
in bBandStop i f bw
