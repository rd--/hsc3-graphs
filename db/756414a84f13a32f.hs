-- gendy1 ; play me
let x = mouseX KR 100 1000 Exponential 0.1
    g = gendy1 'α' AR 1 1 1.0 1.0 30 100 0.3 0.05 5 5
in rlpf g 500 0.3 * 0.1
