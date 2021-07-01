-- sinOsc ; sync ; i.e. <https://www.listarc.bham.ac.uk/lists/sc-dev/msg58316.html>
let dt = mce2 1.0 1.003
    freq = mouseX kr (100 * dt) (3000 * dt) Exponential 0.2
    sync_freq = mouseY kr 100 500 Exponential 0.2
    ph_freq = impulse ar sync_freq 0 + impulse ar freq 0
    o = sinOsc ar 0 (phasor ar ph_freq (freq / sampleRate) 0 1 0 * 2 * pi)
in o * 0.15
