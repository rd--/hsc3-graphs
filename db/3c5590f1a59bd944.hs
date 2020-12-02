-- indexInBetween
let from = asLocalBuf 'α' [1, 2, 4, 8, 16]
    to = asLocalBuf 'β' [0, 1, 0, -1, 0]
    x = mouseX KR 1 16 Linear 0.1
    i = indexL to (indexInBetween from x)
in sinOsc AR (linLin i (-1) 1 440 880) 0 * 0.1
