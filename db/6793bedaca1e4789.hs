-- pv_PlayBuf
let rec_buf = control KR "rec" 10
    fft_buf = localBuf 'β' 1024 1
    n = range (-1) 2 (lfNoise2 'γ' KR 0.2)
    c = X.pv_PlayBuf fft_buf rec_buf n 0 1
in ifft c 1 0
