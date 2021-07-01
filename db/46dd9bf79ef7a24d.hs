-- pv_MagAbove ; synthesised input
let z = sinOsc ar (sinOsc kr (squared (sinOsc kr 0.08 0 * 6 + 6.2)) 0 * 100 + 800) 0
    f = fft' (localBufId 'α' 2048 1) z
    x = mouseX kr 0 512 Linear 0.1
    h = pv_MagAbove f x
in ifft' h * 0.1
