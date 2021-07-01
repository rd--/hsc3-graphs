-- phasorModal
let input = lpf (dust2Id 'α' ar 3) 1500
    freq = control kr "freq" 100.0
    decay = control kr "decay" 0.25
    damp = control kr "damp" 1.0
    amp = control kr "amp" 0.5
    phase = control kr "phase" 0.0
in X.phasorModal input freq decay damp amp phase
