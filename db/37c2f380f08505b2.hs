-- xy-interference (rd, 2006-10-28)
let x = mouseX kr 20 22000 Linear (mce2 0.005 0.025)
    y = mouseY kr 20 22000 Linear (mce2 0.005 0.075)
    nd _ = sinOsc ar (x + lfNoise0 kr (mce2 5 9)) 0 * sinOsc ar y 0
in mixFill 3 nd * 0.5
