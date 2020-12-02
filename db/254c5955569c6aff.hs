-- vibrato ; control depth and depthVariation
let n = lfNoise1 'α' KR 1 * 3 + 7
    x = mouseX KR 0 1 Linear 0.2
    y = mouseY KR 0 1 Linear 0.2
    v = vibrato 'β' AR (dc AR 400) n x 1 1 y 0.1 0 0
in sinOsc AR v 0 * 0.1
