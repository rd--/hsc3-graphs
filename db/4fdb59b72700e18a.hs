-- sortBuf ; gradual erosion
let bufnum = 0
in pan2 (X.sortBuf ar bufnum (lfNoise0 kr 5 * 50000 + 60000) 0) 0 0.1
