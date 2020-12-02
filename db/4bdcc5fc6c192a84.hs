-- pv_Split
let sz = 1024 * 16
    op = (+)
    z = soundIn 0
    c0 = fft' (localBuf 'α' sz 1) z
    (c1,c2) = X.pv_split c0 (localBuf 'β' sz 1)
in ifft' c1 `op` ifft' c2
