-- ampComp ; modified exponent
let freq = mouseX kr 300 15000 Exponential 0.2
in pulse ar freq 0.5 * 0.1 * ampComp kr freq 300 1.3
