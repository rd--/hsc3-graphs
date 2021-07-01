-- bBandStop ; drill
let i = sinOsc ar 1000 0
    f = mouseX kr 800 1200 Exponential 0.2
    bw = mouseY kr 0 10 Linear 0.2
in bBandStop i f bw * 0.1
