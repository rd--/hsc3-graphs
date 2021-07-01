-- fft ; variant with default values
let n = whiteNoiseId 'α' ar
in ifft' (fft' (localBufId 'β' 1 2048) (n * 0.05))
