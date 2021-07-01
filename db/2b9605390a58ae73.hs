-- pv_PlayBuf
let rec_buf = control kr "rec" 10
    fft_buf = localBufId 'β' 1024 1
    n = range (-1) 2 (lfNoise2Id 'γ' kr 0.2)
    c = X.pv_PlayBuf fft_buf rec_buf n 0 1
in ifft c 1 0
