-- pv_Split
let sz = 1024 * 16
    op = (-)
    z = lfClipNoiseId 'α' ar 100 * 0.1
    c0 = fft' (localBufId 'α' sz 1) z
    (c1,c2) = X.pv_SplitUnpack c0 (localBufId 'β' sz 1)
in ifft' c1 `op` ifft' c2
