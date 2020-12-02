-- in ; write noise to first private bus, then read it out ; the multiple root graph is ordered
let n = pinkNoise 'α' AR * 0.1
    b = numOutputBuses + numInputBuses
    wr = out b n
    rd = out 0 (in' 1 AR b)
in mrg [rd,wr]
