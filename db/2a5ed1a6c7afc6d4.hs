-- in ; there are functions to encapsulate the offset calculation, c.f. firstPrivateBus
let n = pinkNoiseId 'α' ar
    wr = privateOut 0 (n * 0.1)
    rd = out 0 (privateIn 1 ar 0)
in mrg [rd,wr]
