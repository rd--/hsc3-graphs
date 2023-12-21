-- fm7 ; two of six ; direct form
let c = mce [xLine kr 300 310 4 DoNothing,0,1
            ,xLine kr 300 310 8 DoNothing,0,1
            ,0,0,1
            ,0,0,1
            ,0,0,1
            ,0,0,1]
    m = mce [line kr 0 0.001 2 DoNothing,line kr 0.1 0 4 DoNothing,0,0,0,0
            ,line kr 0 6 1 DoNothing,0,0,0,0,0
            ,0,0,0,0,0,0
            ,0,0,0,0,0,0
            ,0,0,0,0,0,0
            ,0,0,0,0,0,0]
    [l,r,_,_,_,_] = mceChannels (X.fm7 ar c m)
in mce2 l r * 0.1
