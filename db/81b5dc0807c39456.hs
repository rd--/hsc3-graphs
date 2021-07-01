-- MiClouds
let imp = dustId 'α' ar (mce2 0.8 1.1)
    freq = midiCPS (latch (pinkNoiseId 'β' ar * 24 + 80) imp)
    input = rlpf imp freq 0.002 * 4
    pit = lfNoise1Id 'γ' kr 0.3 * 12
    pos = lfNoise2Id 'δ' kr 0.4 * 0.5 + 0.5
    size = lfNoise1Id 'ε' kr 0.3 * 0.5 + 0.5
    dens = lfNoise1Id 'ζ' kr 0.3 * 0.5 + 0.5
    tex = lfNoise1Id 'η' kr 0.3 * 0.5 + 0.5
    frez = lfClipNoiseId 'θ' kr 0.3
in X.miClouds ar pit pos size dens tex 0.5 2 0.5 0.3 0.8 frez (X.miClouds_mode "GRANULAR") 1 0 input
