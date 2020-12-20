-- pv_PlayBuf ; c.f. pv_RecordBuf
let rec_buf = control KR "rec" 10
    fft_buf = localBuf 'α' 1024 1
    x = mouseX KR (-1) 1 Linear 0.2
    c = X.pv_PlayBuf fft_buf rec_buf x 50 1
in ifft c 1 0
