-- doubleWell3 ; gradually changing
let f = lfSaw AR (line KR 10 1000 10 DoNothing) 0
    delta = line KR 0.0 0.3 20 DoNothing
in X.doubleWell3 AR 0 0.05 f delta 0 0 * 0.2
