-- sinOsc ; reverse cycle & reverse sync
let freq = mouseX kr (100 * mce2 1.0 1.003) (3000 * mce2 1.0 1.003) Exponential 0.2
    sync_freq = mouseY kr 100 500 Exponential 0.2
    direction = toggleFF (impulse ar sync_freq 0 + impulse ar freq 0) * (-2) + 1
    o = sinOsc ar 0 (wrap (sweep ar 0 (direction * freq)) 0 (2 * pi))
in o * 0.5
