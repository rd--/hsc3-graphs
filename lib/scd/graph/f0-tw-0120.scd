// tw 0120 (f0)
{var z = LFTri.kr(1 / #[7, 8], 0) * LFTri.kr(1 / 9, 0) * 99
;var l = (60 .. 79).midicps
;var f = Select.kr(z, l)
;var w = LFTri.kr(1 / #[3, 4], 0) % 1
;var o = VarSaw.ar(f, 0, w)
;CombN.ar(o, 1, 1 / #[5, 6], 8) / 8}

//---- calculations
60.series(nil, 79) == (20.iota + 60) // iota
