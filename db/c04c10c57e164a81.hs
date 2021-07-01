-- https://www.listarc.bham.ac.uk/lists/sc-users/msg68916.html (jrhb)
let a = lfSaw ar 2 0 * 100
    b = lfSaw ar 1.2 0 * 100
in sinOsc ar (lcmE a b + 300) 0 * 0.1
