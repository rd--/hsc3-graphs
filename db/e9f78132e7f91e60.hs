-- oteySoundBoard
let d = dustId 'α' ar 1
    n = whiteNoiseId 'β' ar
    i = decay (d * 0.5) 0.2 * n
    loc = mouseX kr (-1) 1 Linear 0.2
    c1 = 20
    c3 = 20
    mix = 0.8
in X.oteySoundBoard (pan2 i loc 0.1) c1 c3 mix
