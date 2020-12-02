-- whiteNoise ; random filtered noise bursts
let n = whiteNoise 'α' AR
    t = dust 'β' AR (mce [3, 7])
    f = tExpRand 'γ' 20 1800 t
    bw = tExpRand 'δ' 0.001 1 t
    e = decay2 t 0.01 0.2
in resonz (n * e) f bw
