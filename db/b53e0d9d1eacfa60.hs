-- no input fft ; https://www.listarc.bham.ac.uk/liasts/sc-users/msg63383.html
let e_01 = envelope [0.0001,1,0.0001,0.01,0.0001] (map (* 512) (normalizeSum [1,2,2,50])) [EnvExp]
    e_ix e n = constant (envelope_at e (fromIntegral n))
    fft_size = 1024
    fft_f _ = fft (localBuf 1 (constant fft_size)) (dc ar 0) 0.5 0 1 0
    bin_f _mag phase bin =
      (e_ix e_01 bin * range 10 50 (sinOsc kr (rand 0 0.05) (rand 0 (2 * pi)))
      ,phase)
    gen_f n = pvcollect (fft_f n) fft_size bin_f 0 511 0
in ifft (mceFill 2 gen_f) 1 0
