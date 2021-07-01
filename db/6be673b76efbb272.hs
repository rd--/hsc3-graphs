-- gendy1 ; texture
let node e = let f = randId e 130 160.3
                 r0 = randId ('α',e) 0 6
                 r1 = randId ('β',e) 0 6
                 l = randId e (-1) 1
                 ad = sinOsc kr 0.10 0 * 0.49 + 0.51
                 dd = sinOsc kr 0.13 0 * 0.49 + 0.51
                 as = sinOsc kr 0.17 0 * 0.49 + 0.51
                 ds = sinOsc kr 0.19 0 * 0.49 + 0.51
                 g = gendy1Id 'γ' ar r0 r1 ad dd f f as ds 12 12
                 o = sinOsc ar (g * 200 + 400) 0
             in pan2 o l 0.1
in mix (mce (map node (id_seq 10 'δ')))
