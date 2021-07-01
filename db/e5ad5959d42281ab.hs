-- vibrato ; control depth and depthVariation
let n = lfNoise1Id 'α' kr 1 * 3 + 7
    x = mouseX kr 0 1 Linear 0.2
    y = mouseY kr 0 1 Linear 0.2
    v = vibratoId 'β' ar (dc ar 400) n x 1 1 y 0.1 0 0
in sinOsc ar v 0 * 0.1
