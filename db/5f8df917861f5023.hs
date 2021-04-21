-- dwhite ; bias uniform noise to lower range
let n = dwhite 'α' dinf 0 1
    l = control_m KR "l" 48 (0,127,"lin")
    r = control_m KR "r" 96 (0,127,"lin")
    t = impulse KR (control_m KR "trigFreq" 2 (0.01,12,"lin")) 0
    m = exp (demand t 0 n * (log r - log l) + log l)
in sinOsc AR (midiCPS m) 0 * 0.1
