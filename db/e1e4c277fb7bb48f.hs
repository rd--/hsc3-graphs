-- rlpf
let n = whiteNoise 'α' AR
    f = sinOsc AR 0.5 0 * 40 + 220
in rlpf n f 0.1
