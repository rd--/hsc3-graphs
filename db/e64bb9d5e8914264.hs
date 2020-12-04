-- playBufCF ; demand ugens inputs
let b = control KR "buf" 0
    r = drand 'α' dinf (mce [0.95,1,1.05])
    tr = dwhite 'β' dinf 0.1 0.3
    sp = dbrown 'γ' dinf 0 0.95 0.1 * bufFrames KR b
in playBufCF 1 b r tr sp NoLoop 2 5
