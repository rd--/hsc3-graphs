-- dynKlang ; https://www.listarc.bham.ac.uk/lists/sc-users/msg66911.html
let k = 16 :: Int
    f i = (((fromIntegral i ** range_hs (0.3,0.7) (lag (lfNoise0Id i kr 1) 0.1)) + 1) * 99
          ,max 0 (lfNoise1Id i kr (linRandId i 0 10 0)))
    (frq,amp) = unzip (map f [0 .. k - 1])
    s = dynKlang ar 1 0 (klangSpec frq amp (replicate k 0)) * 0.01
in pan2 s 0 1
