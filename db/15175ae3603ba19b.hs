-- gendy1 ; texture
let node e = let f = rand e 130 160.3
                 r0 = rand ('α',e) 0 6
                 r1 = rand ('β',e) 0 6
                 l = rand e (-1) 1
                 ad = sinOsc KR 0.10 0 * 0.49 + 0.51
                 dd = sinOsc KR 0.13 0 * 0.49 + 0.51
                 as = sinOsc KR 0.17 0 * 0.49 + 0.51
                 ds = sinOsc KR 0.19 0 * 0.49 + 0.51
                 g = gendy1 'γ' AR r0 r1 ad dd f f as ds 12 12
                 o = sinOsc AR (g * 200 + 400) 0
             in pan2 o l 0.1
in mix (mce (map node (id_seq 10 'δ')))
