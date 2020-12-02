-- gendy1 ; try durscale 10 and 0 too
let x = mouseX KR 10 700 Linear 0.1
    y = mouseY KR 50 1000 Linear 0.1
    g = gendy1 'α' AR 2 3 1 1 1 x 0.5 0.1 10 10
in combN (resonz g y 0.1) 0.1 0.1 5 * 0.6
