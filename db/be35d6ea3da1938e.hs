-- MiVerb ; stereo ; with freezing
let imp = dust 'α' AR (mce2 0.7 0.8)
    freq = midiCPS (latch (pinkNoise 'β' AR * 24 + 80) imp)
    input = rlpf imp freq 0.002 * 3
    freez = tRand 'γ' (-1) 1 (dust 'δ' KR 0.7)
    revtime = 0.8
    drywet = 0.5
    damping = 0.3
    diff = lfNoise1 'ε' KR 0.1 * 0.5 + 0.5
in X.miVerb revtime drywet damping 0.05 freez 0.625 input
