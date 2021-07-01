-- hpz1 ; detect changes in a signal (see also hpz2)
let n = lfNoise0Id 'α' ar 1000
    h = hpz1 n
in mce [h,h `greater_than` 0,abs h `greater_than` 0]
