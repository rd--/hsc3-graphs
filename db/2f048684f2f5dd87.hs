-- bpf ; ln 2021-04-11 https://lukasnowok.github.io/spectrology/
let n = bpf (whiteNoiseId 'α' ar) 10000 (xLine ar 2 0.002 20 DoNothing)
    o = sinOsc ar 10000 0 * xLine ar 0.001 0.3 20 DoNothing
in (n + o) * 0.1
