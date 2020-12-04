-- fft ; variant with default values
let n = whiteNoise 'α' AR
in ifft' (fft' (localBuf 'β' 1 2048) (n * 0.05))
