-- pv_SpectralMap
let y = mouseY kr (-1) 1 Linear 0.2
    x = mouseX kr (-1) 1 Linear 0.2
    b = control kr "buf" 0
    c1 = fft' (localBufId 'α' 2048 1) (soundIn 0)
    c2 = fft' (localBufId 'β' 2048 1) (playBuf 1 ar b 1 1 0 Loop DoNothing)
    c3 = X.pv_SpectralMap c1 c2 0.0 y x 1 0
in ifft' c3
