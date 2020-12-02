-- osc ; requires=tbl ; mouse frequency control
let b = control KR "tbl" 0
in osc AR b (mouseX KR 110 220 Exponential 0.2) 0 * 0.1
