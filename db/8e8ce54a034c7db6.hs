-- https://www.listarc.bham.ac.uk/lists/sc-users/msg68916.html (jrhb)
let a = lfSaw AR 0.02 0 * 300 + 1
    b = lfSaw AR (1.24 + mce2 0 0.1) 0 * 200 + 1
in sinOsc AR (gcdE a b * 30 + 300) 0 * 0.1
