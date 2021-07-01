-- pv_SpectralMap ; https://scsynth.org/t/share-your-delay-reverb-designs/2206/6
let freeze = control kr "freeze" 0
    mode = control kr "mode" 1
    roomsize = control kr "roomsize" 10
    revtime = control kr "revtime" 6
    c1 = fft' (localBufId 'α' 2048 1) (soundIn 0)
    c2 = fft' (localBufId 'β' 2048 1) (soundIn 1)
    c3 = X.pv_SpectralMap c1 c2 0.0 freeze mode 1 0
in gVerb (ifft' c3) roomsize revtime 0.5 0.5 15 1 0.7 0.5 300
