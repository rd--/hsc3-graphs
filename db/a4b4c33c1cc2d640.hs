-- ampComp ; mouse frequency control
let freq = mouseX kr 300 15000 Exponential 0.2
in sinOsc ar freq 0 * 0.1 * ampComp kr freq 300 0.3333
