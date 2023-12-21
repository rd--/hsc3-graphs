-- fm7 ; two of six ; matrix form ; inputs may be audio or control or initialization rate
let rt = ar
    c = [[xLine rt 300 310 4 DoNothing,0,1]
        ,[xLine rt 300 310 8 DoNothing,0,1]
        ,[0,0,1]
        ,[0,0,1]
        ,[0,0,1]
        ,[0,0,1] ]
    m = [[line rt 0 0.001 2 DoNothing,line rt 0.1 0 4 DoNothing,0,0,0,0]
        ,[line rt 0 6 1 DoNothing,0,0,0,0,0]
        ,[0,0,0,0,0,0]
        ,[0,0,0,0,0,0]
        ,[0,0,0,0,0,0]
        ,[0,0,0,0,0,0] ]
    [l,r,_,_,_,_] = mceChannels (X.fm7_mx c m)
in mce2 l r * 0.1
