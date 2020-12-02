-- shaper ; minor variation ; requires=tbl
let z = sinOsc AR 400 (pi / 2) * line KR 0 1 6 DoNothing
in shaper (control KR "tbl" 10) z * 0.1
