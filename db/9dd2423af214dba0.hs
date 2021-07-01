-- linLin ; modulating source and destination values
let n = lfNoise2Id 'α' ar 80
    x = mouseX kr 200 8000 Linear 0.2
    y = mouseY kr 200 8000 Linear 0.2
    f = linLin n (sinOsc kr 0.2 0) (sinOsc kr 0.2543 0) x y
in sinOsc ar f 0 * 0.1
