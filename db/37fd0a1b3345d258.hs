-- in ; write noise to first private bus, then read it out ; the multiple root graph is ordered
let n = pinkNoiseId 'α' ar * 0.1
    b = numOutputBuses + numInputBuses
    wr = out b n
    rd = out 0 (in' 1 ar b)
in mrg [rd,wr]
