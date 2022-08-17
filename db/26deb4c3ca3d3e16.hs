-- sinOsc ; reverse sync
let dt = mce2 1.0 1.003
    freq = mouseX kr (100 * dt) (3000 * dt) Exponential 0.2
    sync_freq = mouseY kr 100 500 Exponential 0.2
    direction = toggleFF (impulse ar sync_freq 0) * (-2) + 1
    o = sinOsc ar 0 (wrap (sweep ar (impulse ar freq 0) (direction * freq)) 0 (2 * pi))
in o * 0.15
