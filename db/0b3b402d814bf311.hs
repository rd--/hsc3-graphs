-- resonator
let pan = 0
    trig = impulse kr 1 0
    snare = X.analogSnareDrum ar trig 0 0.1 200 0.5 (tRandId 'α' 0.1 0.5 trig) 0.5
    freq = tExpRandId 'β' 25 250 trig
    position = 0
    resolution = 24
    structure = sinOsc kr 0.01 0 `in_range` (0,1)
    brightness = sinOsc kr 0.01 (0.5 * pi) `in_range` (0,0.5)
    damping = tRandId 'γ' 0.2 0.8 trig
    sig = X.resonator snare freq position resolution structure brightness damping
in pan2 (tanh sig) pan 0.1
