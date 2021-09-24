-- MiVerb ; stereo ; with freezing
let imp = dustId 'α' ar (mce2 0.7 0.8)
    freq = midiCps (latch (pinkNoiseId 'β' ar * 24 + 80) imp)
    input = rlpf imp freq 0.002 * 3
    freez = tRandId 'γ' (-1) 1 (dustId 'δ' kr 0.7)
    revtime = 0.8
    drywet = 0.5
    damping = 0.3
    diff = lfNoise1Id 'ε' kr 0.1 * 0.5 + 0.5
in X.miVerb revtime drywet damping 0.05 freez 0.625 input
