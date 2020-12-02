-- grainSin ; f0 https://www.listarc.bham.ac.uk/lists/sc-users/msg66911.html
let k = 16
    t = impulse AR (mouseY KR 1 999 Linear 0.2) 0
    f i = ((fromIntegral i ** range_hs (0.3,0.7) (lfNoise0 i KR 1)) + 1) * 99
    l = mce (map f [0::Int .. k - 1])
in grainSin 2 t (mouseX KR 0.001 0.5 Exponential 0.2) (tChoose 'α' t l) 0 (-1) 512 * 0.1
