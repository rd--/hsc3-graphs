-- indexInBetween ; index into buffer for frequency values
let f0 = mouseX kr 200 900 Linear 0.1
    b = asLocalBufId 'α' [200,210,400,430,600,800]
    i = indexInBetween b f0
    l0 = index b i
    l1 = index b (i + 1)
    f1 = linLin (frac i) 0 1 l0 l1
in sinOsc ar (mce [f0,f1]) 0 * 0.1
