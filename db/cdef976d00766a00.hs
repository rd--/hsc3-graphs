-- ifft ; variants with the default parameters
let z = whiteNoise 'α' AR
    c = fft' (localBuf 'β' 1 2048) z
in ifft' c * 0.05
