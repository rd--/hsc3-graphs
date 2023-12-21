-- https://www.listarc.bham.ac.uk/lists/sc-users/msg18379.html (f0)
let t = T2A 0 0
    o0 = LfSaw 3 0 * 9 + 99
    s0 = Sweep t [3..9] % o0
    s1 = Sweep t [33, 32..3] % 128 .&. s0
    o1 = SinOsc (MidiCps (s1 + 33)) 0 * pi
in Splay2 (SinOsc 9 o1) / 12
