-- loopBuf
let bf = control KR "bufnum" 0
    rt = control KR "rate" 1
    gl = control KR "glide" 0
    gt = control KR "gate" 1
    lr = control KR "loopRel" 0
    sp = control KR "startPos" 0
    sl = control KR "startLoop" 0 -- FRAME
    el = control KR "endLoop" 0 -- FRAME
    ip = control KR "ipol" 2
    am = control KR "amp" 0.1
    rt' = lag rt gl * bufRateScale KR bf
    e = let d = envADSR 0.1 0.2 1 2 1 (EnvNum (-4)) 0
        in envGen AR gt 1 0 1 RemoveSynth d
    s = X.loopBuf 1 AR bf rt' (gt + lr) sp sl el ip
in s * e * am
