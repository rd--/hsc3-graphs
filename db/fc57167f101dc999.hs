-- dseq ; distinct dseq, equal patterns
uid_st_eval
(do a <- replicateM 2 (dseqM 3 (mce [1,3,2,7,8]))
    let t = impulse kr 5 0
        f = demand t 0 (mce a) * 30 + 340
    return (sinOsc ar f 0 * 0.1))
