-- splay ; single channel input
let x = mouseX kr (-1) 1 Linear 0.1
    y = mouseY kr 1 0 Linear 0.1
    o = sinOsc ar (lfNoise2Id 'α' kr 6 * 9 + 440) 0 * 0.1
in splay o y 0.2 x True
