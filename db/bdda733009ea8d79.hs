-- henonN ; with randomly modulated parameters
let n0 = lfNoise2 'α' KR 1 * 0.20 + 1.20
    n1 = lfNoise2 'β' KR 1 * 0.15 + 0.15
in henonN AR (sampleRate / 8) n0 n1 0 0 * 0.1
