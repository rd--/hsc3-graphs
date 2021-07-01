-- dwhite ; bias uniform noise to lower range
let n = dwhiteId 'α' dinf 0 1
    l = control_m kr "l" 48 (0,127,"lin")
    r = control_m kr "r" 96 (0,127,"lin")
    t = impulse kr (control_m kr "trigFreq" 2 (0.01,12,"lin")) 0
    m = exp (demand t 0 n * (log r - log l) + log l)
in sinOsc ar (midiCPS m) 0 * 0.1
