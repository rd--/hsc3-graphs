-- sinOsc ; control_m inputs
let f = control_m kr "mnn" 69 (0,127,"lin")
    a = control_m kr "amp" 0.25 (0,1,"amp")
in sinOsc ar (midiCPS f) 0 * a
