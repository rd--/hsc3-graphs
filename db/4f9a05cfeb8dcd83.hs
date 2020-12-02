-- https://www.listarc.bham.ac.uk/lists/sc-users/msg68916.html (jrhb)
let a = lfSaw AR 2 0 * 100
    b = lfSaw AR 1.2 0 * 100
in sinOsc AR (lcmE a b + 300) 0 * 0.1
