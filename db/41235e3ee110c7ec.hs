-- ampComp ; mouse frequency control
let freq = mouseX KR 300 15000 Exponential 0.2
in sinOsc AR freq 0 * 0.1 * ampComp KR freq 300 0.3333
