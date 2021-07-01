-- combC ; as an echo
let d = dustId 'α' ar 1
    n = whiteNoiseId 'β' ar * 0.1
    i = decay d 0.2 * n
in combC i 0.2 0.2 3
