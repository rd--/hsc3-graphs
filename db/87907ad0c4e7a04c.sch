-- f0 <https://twitter.com/redFrik/status/1254441448327479299> ; edit=rd
let b = [1, 3, 5, 8, 10]
    e = [3, 2/3, 4, 3/2, 2]
    c = 0.021
    d = LfTri (b / 999) 0 % 1
    m = LfTri (b * c) 0
    l = m * 7 + 20 + Dseq inf (b % m * 5 + 6)
    j = Duty (e / (12 ** m)) 0 doNothing l
    k = DegreeToKey (asLocalBuf b) j 12
    o = SinOscFb (MidiCps k) (LfTri (((c / b) + 1) / 3) 1 * d)
in FreeVerb (Splay2 o) 0.1 1 0.5 * 0.2
