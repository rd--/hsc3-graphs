-- bBandStop ; drill
let i = sinOsc AR 1000 0
    f = mouseX KR 800 1200 Exponential 0.2
    bw = mouseY KR 0 10 Linear 0.2
in bBandStop i f bw * 0.1
