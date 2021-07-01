-- whiteNoise ; random filtered noise bursts
let n = whiteNoiseId 'α' ar
    t = dustId 'β' ar (mce [3, 7])
    f = tExpRandId 'γ' 20 1800 t
    bw = tExpRandId 'δ' 0.001 1 t
    e = decay2 t 0.01 0.2
in resonz (n * e) f bw
