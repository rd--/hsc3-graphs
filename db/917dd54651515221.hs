-- pv_MagAbove
let z = soundIn 0
    f = fft' (localBufId 'α' 2048 1) z
    x = mouseX kr 0 64 Linear 0.1
    h = pv_MagAbove f x
in ifft' h * 0.5
