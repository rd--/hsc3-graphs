-- MiTides ; Lightbath -- Loom 4
let bpm = 140
    period = (60 / bpm) * 6
    speed = 1.0 / period
    del_times = period / mce2 6 8
    tr = impulse kr speed 0
    clock = phasor kr tr 1 0 1 0
    pit = tChooseId 'α' tr (mce [67, 60, 65])
    shape = lfTri kr 0.11 0 `in_range` (0,1)
    slope_ = lfTri kr 0.11 0 `in_range` (0.5,0.8)
    smooth = lfNoise1Id 'β' kr 0.07 `in_range` (0.25,0.7)
    chord = lfNoise1Id 'γ' kr 0.03 `in_range` (0.0,0.5)
    oscs = X.miTides ar (midiCPS pit) shape slope_ smooth chord 0 0 3 1 9 1
    envs = X.miTides ar speed 0.35 0 0.46 0.92 0 clock 3 1 {-ratio:-} 9 {-rate:-} 0
    scaler = lfNoise1Id 'δ' kr (mce [0.1, 0.07, 0.11, 0.05])
    sig = splay (oscs * envs * scaler) 1 1 (lfTri kr 0.1 0) True
    del = combL sig 2 del_times 6 * 0.5
in sig + del
