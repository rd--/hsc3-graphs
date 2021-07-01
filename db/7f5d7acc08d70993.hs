-- henonN ; with randomly modulated parameters
let n0 = lfNoise2Id 'α' kr 1 * 0.20 + 1.20
    n1 = lfNoise2Id 'β' kr 1 * 0.15 + 0.15
in henonN ar (sampleRate / 8) n0 n1 0 0 * 0.1
