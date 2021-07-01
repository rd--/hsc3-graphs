-- pv_BrickWall
let z = soundIn 0
    x = mouseX kr (-1) 1 Linear 0.1
    c = fft' (localBufId 'α' 2048 1) z
in ifft' (pv_BrickWall c x)
