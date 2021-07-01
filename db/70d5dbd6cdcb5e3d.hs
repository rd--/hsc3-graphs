-- lorenzTrig ; randomly modulate params
let minfreq = 11025
    maxfreq = 44100
    s = lfNoise0Id 'α' kr 1 * 2 + 10
    b = lfNoise0Id 'β' kr 1 * 1.5 + 2
    r = 28
    h = 0.02
    x0 = 0.090879182417163
    y0 = 2.97077458055
    z0 = 24.282041054363
in X.lorenzTrig ar minfreq maxfreq s r b h x0 y0 z0 * 0.2
