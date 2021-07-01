-- gendy1 ; self modulation
let x = mouseX kr 1   13 Linear 0.1
    y = mouseY kr 0.1 10 Linear 0.1
    g0 = gendy1Id 'α' ar 5 4 0.3 0.7 0.1 y 1.0 1.0 5 5
in gendy1Id 'α' ar 1 1 1 1 440 (g0 * 500 + 600) 0.5 0.5 12 x * 0.2
