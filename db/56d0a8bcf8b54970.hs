-- rdx7 ; texture node ; data at local buffer
let vc = [[25,21,98,38,99, 0,99, 0,36,17,87,2,1,0,0,0,59,0, 1,1,8]
         ,[66,69,60,35, 0, 0,98, 0, 0, 0, 4,0,0,0,0,1,90,0, 1,0,8]
         ,[25,21,98,38,99, 0,99, 2,35,15,79,3,1,1,0,0,91,1, 0,0,6]
         ,[97,69,60,35,99,91,98, 0, 0, 0, 0,0,0,0,0,1,68,0,22,0,7]
         ,[78,63,53,28,99,52,62, 3,38,11,80,3,0,0,0,0,77,0, 7,0,0]
         ,[98,56,63,23,99,89,74, 2, 0, 4, 1,0,0,0,0,0,99,0, 1,0,7]
         ,[99,99,99,99,50,50,50,50,3,2,1,29,99,1,0,0,0,1,24]]
    dur = randId 'α' 0.1 10.0
    mnn = iRandId 'β' 48 72
    vel = iRandId 'γ' 10 69
    loc = randId 'δ' (-1) 1
    gate_ = line kr 1 0 dur DoNothing
    reset_ = 0
    data_ = 0
    buf = asLocalBufId 'ε' (map constant (concat vc))
    s = pan2 (X.rdx7 ar buf gate_ reset_ data_ 0 mnn vel 0x2000 0 0 0) loc 1
    d = detectSilence s 0.001 0.1 RemoveSynth
in mrg [out 0 s,d]
