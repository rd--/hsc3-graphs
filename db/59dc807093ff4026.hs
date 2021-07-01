-- rlpf
let n = whiteNoiseId 'α' ar
    f = sinOsc ar 0.5 0 * 40 + 220
in rlpf n f 0.1
