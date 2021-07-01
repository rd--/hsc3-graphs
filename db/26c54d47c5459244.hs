-- balance2
let s = pinkNoiseId 'α' ar
    l = lpf s 500
    h = s - l
    n = lfNoise2Id 'β' kr 4
in balance2 l h n 0.1
