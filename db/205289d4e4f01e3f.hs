-- vibrato ; control rate and rateVariation
let x = mouseX KR 2 100 Linear 0.2
    y = mouseY KR 0 1 Linear 0.2
    v = vibrato 'α' AR (dc AR 400) x 0.1 1 1 y 0.1 0 0
in sinOsc AR v 0 * 0.1
