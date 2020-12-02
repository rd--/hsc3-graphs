-- randSeed ; start a sound that includes noise ugens
let n = Protect.uclone_all 'α' 2 (whiteNoise 'β' AR * 0.05 + dust2 'γ' AR 70)
    f = lfNoise1 'δ' KR 3 * 5500 + 6000
in resonz (n * 5) f 0.5 + n * 0.5
