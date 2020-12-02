-- shaper ; hear waveshaper at pure (sin) tone ; requires=tbl see b_gen_cheby
let z = sinOsc AR 300 0 * line KR 0 1 6 DoNothing
in shaper (control KR "tbl" 10) z * 0.1
