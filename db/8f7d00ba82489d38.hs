-- sinOsc ; reverse cycle & reverse sync
let freq = mouseX KR (100 * mce2 1.0 1.003) (3000 * mce2 1.0 1.003) Exponential 0.2
    sync_freq = mouseY KR 100 500 Exponential 0.2
    direction = toggleFF (impulse AR sync_freq 0 + impulse AR freq 0) * (-2) + 1
    o = sinOsc AR 0 (wrap (sweep (k2a 0) (direction * freq)) 0 (2 * pi))
in o * 0.5
