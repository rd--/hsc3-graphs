-- pv_PlayBuf ; c.f. pv_RecordBuf
let rec_buf = control kr "rec" 10
    fft_buf = localBufId 'α' 1024 1
    x = mouseX kr (-1) 1 Linear 0.2
    c = X.pv_PlayBuf fft_buf rec_buf x 50 1
in ifft c 1 0
