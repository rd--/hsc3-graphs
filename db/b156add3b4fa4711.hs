-- RShufflerL ; arrayed
let n = 6
    x = mouseX KR 0.0001 0.02 Linear 0.2
    y = mouseY KR 0.001 0.25 Linear 0.2
    f = x * X.randN n 'α' 0 4
    d = y * X.randN n 'β' 0 4
    o = sinOsc AR (mce2 440 441) 0 * 0.1
in splay (X.rShufflerL o f d) 1 1 0 True