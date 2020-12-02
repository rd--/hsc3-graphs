-- in ; there are functions to encapsulate the offset calculation, c.f. firstPrivateBus
let n = pinkNoise 'α' AR
    wr = privateOut 0 (n * 0.1)
    rd = out 0 (privateIn 1 AR 0)
in mrg [rd,wr]
