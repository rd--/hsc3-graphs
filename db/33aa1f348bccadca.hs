-- shaper ; minor variation ; requires=tbl
let z = sinOsc ar 400 (pi / 2) * line kr 0 1 6 DoNothing
in shaper (control kr "tbl" 10) z * 0.1
