-- loopBuf
let bf = control kr "bufnum" 0
    rt = control kr "rate" 1
    gl = control kr "glide" 0
    gt = control kr "gate" 1
    lr = control kr "loopRel" 0
    sp = control kr "startPos" 0
    sl = control kr "startLoop" 0 -- FRAME
    el = control kr "endLoop" 0 -- FRAME
    ip = control kr "ipol" 2
    am = control kr "amp" 0.1
    rt' = lag rt gl * bufRateScale kr bf
    e = let d = envADSR 0.1 0.2 1 2 1 (EnvNum (-4)) 0
        in envGen ar gt 1 0 1 RemoveSynth d
    s = X.loopBuf 1 ar bf rt' (gt + lr) sp sl el ip
in s * e * am
