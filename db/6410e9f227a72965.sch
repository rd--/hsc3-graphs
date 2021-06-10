-- https://www.listarc.bham.ac.uk/lists/sc-users/msg18379.html (f0)
let t = t2a 0 0
    o0 = lfsaw 3 0 * 9 + 99
    s0 = sweep t [3..9] % o0
    s1 = sweep t [33,32..3] % 128 .&. s0
    o1 = sinosc (midicps (s1 + 33)) 0 * pi
in splay (sinosc 9 o1) 1 1 0 true / 12
