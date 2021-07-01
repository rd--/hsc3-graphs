-- https://www.listarc.bham.ac.uk/lists/sc-users/msg68916.html (jrhb)
let a = lfSaw kr 0.002 0 * 300 + 1
    b = lfSaw kr (0.024 + mce2 0 0.001) 0 * 200 + 1
in sinOsc ar (gcdE a b * 43 + 300) 0 * 0.1
