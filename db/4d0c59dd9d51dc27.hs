-- ifft ; variants with the default parameters
let z = whiteNoiseId 'α' ar
    c = fft' (localBufId 'β' 1 2048) z
in ifft' c * 0.05
