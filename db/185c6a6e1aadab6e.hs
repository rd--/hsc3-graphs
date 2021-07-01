-- pv_Split ; pv_splita works with external buffers as well
let b = control kr "buf" 0
    z = soundIn 0
    c1 = fft b z 0.5 0 1 0
    (c2,c3) = X.pv_SplitAllocUnpackId 'γ' c1
    c4 = pv_BrickWall c2 (-0.85)
    c5 = pv_BrickWall c3 0.45
in ifft c4 0 0 * 0.15 + ifft c5 0 0
