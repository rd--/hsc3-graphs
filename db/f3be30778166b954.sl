/* SparseMatrixMixer ; displace 4-channel input by two places at 6-channel output */
SparseMatrixMixer(6, SinOsc([32 .. 35], 0) * 0.25, [1 3 1; 2 4 1; 3 5 1; 4 6 1])
