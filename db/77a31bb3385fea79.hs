-- bBandPass ; warning=feedback
let i = soundIn 0
    f = mouseX kr 20 20000 Exponential 0.2
    bw = mouseY kr 0 10 Linear 0.2
in bBandPass i f bw
