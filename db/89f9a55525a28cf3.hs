-- splay ; single channel input
let x = mouseX KR (-1) 1 Linear 0.1
    y = mouseY KR 1 0 Linear 0.1
    o = sinOsc AR (lfNoise2 'α' KR 6 * 9 + 440) 0 * 0.1
in splay o y 0.2 x True
