-- xy-interference (rd, 2006-10-28) ; id
let x = mouseX kr 20 22000 Linear (mce2 0.005 0.025)
    y = mouseY kr 20 22000 Linear (mce2 0.005 0.075)
    nd z _ = let n = lfNoise0Id (z,'α') kr (mce2 5 9)
                 a = sinOsc ar (x + n) 0
                 b = sinOsc ar y 0
             in a * b
in mixFillId 'β' 3 nd
