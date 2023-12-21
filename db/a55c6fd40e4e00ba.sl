(* SparseMatrixMixer ; copy 2-channel input to channels 9 & 13 of 24-channel output *)
SparseMatrixMixer(24, SinOsc([220, 221], 0) * 0.1, [1 9 1; 2 13 1])
