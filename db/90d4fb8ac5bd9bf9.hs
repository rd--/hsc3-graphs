-- balance2
let s = pinkNoise 'α' AR
    l = lpf s 500
    h = s - l
    n = lfNoise2 'β' KR 4
in balance2 l h n 0.1
