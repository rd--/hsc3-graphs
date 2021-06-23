-- dseq ; shared dseq, different patterns
uid_st_eval
(do a <- dseqM 3 (mce [1,3,2,7,8])
    let t = impulse KR 5 0
        f = demand t 0 (mce [a,a]) * 30 + 340
    return (sinOsc AR f 0 * 0.1))
