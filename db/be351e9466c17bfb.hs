-- linLin ; modulating source and destination values
let n = lfNoise2 'α' AR 80
    x = mouseX KR 200 8000 Linear 0.2
    y = mouseY KR 200 8000 Linear 0.2
    f = linLin n (sinOsc KR 0.2 0) (sinOsc KR 0.2543 0) x y
in sinOsc AR f 0 * 0.1
