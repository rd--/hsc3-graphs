-- sinOsc ; control_m inputs
let f = control_m KR "mnn" 69 (0,127,"lin")
    a = control_m KR "amp" 0.25 (0,1,"amp")
in sinOsc AR (midiCPS f) 0 * a
