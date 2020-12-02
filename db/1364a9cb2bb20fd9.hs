-- lorenzL
let x = mouseX KR 1 200 Linear 0.1
    n = lorenzL AR x 10 28 2.667 0.05 0.1 0 0
in impulse AR (n * 4 + 8) 0 * 0.4
