-- gendy1 ; play me
let x = mouseX kr 100 1000 Exponential 0.1
    g = gendy1Id 'α' ar 1 1 1.0 1.0 30 100 0.3 0.05 5 5
in rlpf g 500 0.3 * 0.1
