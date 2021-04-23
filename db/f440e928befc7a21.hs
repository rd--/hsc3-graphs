-- bpf ; ln 2021-04-11 https://lukasnowok.github.io/spectrology/
let n = bpf (whiteNoise 'α' AR) 10000 (xLine AR 2 0.002 20 DoNothing)
    o = sinOsc AR 10000 0 * xLine AR 0.001 0.3 20 DoNothing
in (n + o) * 0.1
