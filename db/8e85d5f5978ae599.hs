-- grainSin ; f0 https://www.listarc.bham.ac.uk/lists/sc-users/msg66911.html
let k = 16
    t = impulse ar (mouseY kr 1 999 Linear 0.2) 0
    f i = ((fromIntegral i ** range_hs (0.3,0.7) (lfNoise0Id i kr 1)) + 1) * 99
    l = mce (map f [0::Int .. k - 1])
in grainSin 2 t (mouseX kr 0.001 0.5 Exponential 0.2) (tChooseId 'α' t l) 0 (-1) 512 * 0.1
