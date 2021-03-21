-- blOsc ; k-rate (not implemented for width/waveform)
let freq = control_m KR "freq" 110 (55,880,"exp")
    width = control_m KR "width" 0.5 (0,1,"lin")
    waveform = control_m KR "waveform" 0 (0,2,"lin")
in X.blOsc AR freq width waveform * 0.1
