-- http://sccode.org/1-4Qy (f0)
let z = LfTri [1/7,  1/8] 0 * LfTri (1/9) 0 * 99
    l = map MidiCps [60 .. 79]
    f = Select z l
    w = LfTri [1/3,  1/4] 0 % 1
    o = VarSaw (cr f) 0 (cr w)
in CombN o 1 [1/5,  1/6] 8 / 8
