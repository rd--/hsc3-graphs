-- MiClouds
let imp = dust 'α' AR (mce2 0.8 1.1)
    freq = midiCPS (latch (pinkNoise 'β' AR * 24 + 80) imp)
    input = rlpf imp freq 0.002 * 4
    pit = lfNoise1 'γ' KR 0.3 * 12
    pos = lfNoise2 'δ' KR 0.4 * 0.5 + 0.5
    size = lfNoise1 'ε' KR 0.3 * 0.5 + 0.5
    dens = lfNoise1 'ζ' KR 0.3 * 0.5 + 0.5
    tex = lfNoise1 'η' KR 0.3 * 0.5 + 0.5
    frez = lfClipNoise 'θ' KR 0.3
in X.miClouds AR pit pos size dens tex 0.5 2 0.5 0.3 0.8 frez (X.miClouds_mode "GRANULAR") 1 0 input
