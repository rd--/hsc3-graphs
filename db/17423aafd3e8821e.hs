-- osc ; requires=tbl ; mouse frequency control
let b = control kr "tbl" 0
in osc ar b (mouseX kr 110 220 Exponential 0.2) 0 * 0.1
