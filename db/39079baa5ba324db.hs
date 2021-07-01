-- pv_Split ; pv_splita is a variant that allocates a local buffer, deriving the size from the input graph
let s = whiteNoiseId 'α' ar * 0.1
    c1 = fftAllocId 'β' 2048 s 0.5 0 1 0
    (c2,c3) = X.pv_SplitAllocUnpackId 'γ' c1
    c4 = pv_BrickWall c2 (-0.85)
    c5 = pv_BrickWall c3 0.45
in ifft c4 0 0 * 0.15 + ifft c5 0 0
