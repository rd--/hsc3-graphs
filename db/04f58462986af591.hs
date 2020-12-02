-- https://www.listarc.bham.ac.uk/lists/sc-users/msg68916.html (jrhb)
let a = lfSaw AR 0.012 0 * 300 + 1
    b = lfSaw AR (0.24 + mce2 0 0.01) 0 * 200 + 1
in sinOsc AR (gcdE a b * 30 + 300) 0 * 0.1
