-- vibrato ; control rate and rateVariation
let x = mouseX kr 2 100 Linear 0.2
    y = mouseY kr 0 1 Linear 0.2
    v = vibratoId 'α' ar (dc ar 400) x 0.1 1 1 y 0.1 0 0
in sinOsc ar v 0 * 0.1
