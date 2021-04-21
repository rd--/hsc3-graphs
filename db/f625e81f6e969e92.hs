-- select ; buffer segment player ; requires=buf
let nc = 2
    buf = control KR "buf" 0
    n_segments = control_m KR "nseg" 32 (1,64,"lin")
    sel = control_m KR "sel" 0 (0,3,"lin")
    buf_size = bufFrames KR buf
    segment_size = bufFrames KR buf / n_segments
    tr = impulse KR (n_segments / bufDur KR buf) 0
    phase = phasor AR tr (bufRateScale KR buf) 0 (segment_size - 1) 0
    ix = mce [dseries 'α' dinf 0 1 `modE` n_segments -- play segments in sequence (reconstruct)
             ,n_segments - 1 - (dseries 'β' dinf 0 1 `modE` n_segments) -- play segments in reverse sequence
             ,dbrown 'γ' dinf 0 (n_segments - 1) 1
             ,dwhite 'δ' dinf 0 (n_segments - 1)]
    zero = select sel (demand tr 0 (ix * segment_size))
in bufRdN nc AR buf (zero + phase) NoLoop * 0.1
