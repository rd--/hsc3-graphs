-- select ; buffer segment player ; requires=buf
let nc = 2
    buf = control kr "buf" 0
    n_segments = control_m kr "nseg" 32 (1,64,"lin")
    sel = control_m kr "sel" 0 (0,3,"lin")
    buf_size = bufFrames kr buf
    segment_size = bufFrames kr buf / n_segments
    tr = impulse kr (n_segments / bufDur kr buf) 0
    phase = phasor ar tr (bufRateScale kr buf) 0 (segment_size - 1) 0
    ix = mce [dseriesId 'α' dinf 0 1 `modE` n_segments -- play segments in sequence (reconstruct)
             ,n_segments - 1 - (dseriesId 'β' dinf 0 1 `modE` n_segments) -- play segments in reverse sequence
             ,dbrownId 'γ' dinf 0 (n_segments - 1) 1
             ,dwhiteId 'δ' dinf 0 (n_segments - 1)]
    zero = select sel (demand tr 0 (ix * segment_size))
in bufRdN nc ar buf (zero + phase) NoLoop * 0.1
