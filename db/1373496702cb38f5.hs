-- gendy1 ; scream
let x = mouseX KR 220 440 Exponential 0.1
    y = mouseY KR 0.0 1.0 Linear 0.1
in gendy1 'α' AR 2 3 1 1 x (8 * x) y y 7 7 *0.3
