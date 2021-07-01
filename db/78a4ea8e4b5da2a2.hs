-- blOsc ; k-rate (not implemented for width/waveform)
let freq = control_m kr "freq" 110 (55,880,"exp")
    width = control_m kr "width" 0.5 (0,1,"lin")
    waveform = control_m kr "waveform" 0 (0,2,"lin")
in X.blOsc ar freq width waveform * 0.1
