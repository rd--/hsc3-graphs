-- indexL ; index buffer for frequency values
let b = asLocalBuf 'α' [50,100,200,400,800,1600]
    ph = 1 -- 0
    i = range 0 7 (lfSaw KR 0.1 ph)
in sinOsc AR (mce2 (indexL b i) (index b i)) 0 * 0.1
