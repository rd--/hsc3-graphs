-- osc ; requires=tbl ;  modulate frequency
let b = control KR "tbl" 0
    f = xLine KR 2000 200 1 DoNothing
in osc AR b f 0 * 0.1
