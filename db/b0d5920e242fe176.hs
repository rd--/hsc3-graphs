-- sinOsc ; sync ; i.e. <https://www.listarc.bham.ac.uk/lists/sc-dev/msg58316.html>
let dt = mce2 1.0 1.003
    freq = mouseX KR (100 * dt) (3000 * dt) Exponential 0.2
    sync_freq = mouseY KR 100 500 Exponential 0.2
    ph_freq = impulse AR sync_freq 0 + impulse AR freq 0
    o = sinOsc AR 0 (phasor AR ph_freq (freq / sampleRate) 0 1 0 * 2 * pi)
in o * 0.15
