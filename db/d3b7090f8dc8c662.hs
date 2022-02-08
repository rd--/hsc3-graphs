-- shaper ; hear waveshaper at pure (sin) tone ; requires=tbl see b_gen_cheby at b_gen help file
let z = sinOsc ar 300 0 * line kr 0 1 6 DoNothing
in shaper (control kr "tbl" 10) z * 0.1
