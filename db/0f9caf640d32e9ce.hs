-- phasorModal
let input = lpf (dust2 'α' AR 3) 1500
    freq = control KR "freq" 100.0
    decay = control KR "decay" 0.25
    damp = control KR "damp" 1.0
    amp = control KR "amp" 0.5
    phase = control KR "phase" 0.0
in X.phasorModal input freq decay damp amp phase
