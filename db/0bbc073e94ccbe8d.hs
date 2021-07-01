-- localBuf ; not clearing the buffer accesses old data, slowly overwrite data with noise
let dup (p,q) f = mce2 (f p) (f q)
    b = localBufId 'α' 2 2048
    nf = bufFrames kr b
    x = mouseX kr 1 2 Linear 0.2
    r = playBuf 2 ar b x 1 0 Loop DoNothing * 0.1
    wr p i = bufWr b (linLin p (-1) 1 0 nf) Loop i
    n = dup ('β','γ') (\z -> whiteNoiseId z ar)
    ph = lfNoise0Id 'δ' ar 530
in mrg2 r (wr ph n)
