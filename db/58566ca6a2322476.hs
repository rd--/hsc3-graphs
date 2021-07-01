-- osc ; requires=tbl ;  modulate frequency
let b = control kr "tbl" 0
    f = xLine kr 2000 200 1 DoNothing
in osc ar b f 0 * 0.1
