-- ampComp ; modified exponent
let freq = mouseX KR 300 15000 Exponential 0.2
in pulse AR freq 0.5 * 0.1 * ampComp KR freq 300 1.3
