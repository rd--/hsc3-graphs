-- combC ; as an echo
let d = dust 'α' AR 1
    n = whiteNoise 'β' AR * 0.1
    i = decay d 0.2 * n
in combC i 0.2 0.2 3
