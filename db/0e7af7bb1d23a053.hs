-- playBufCF ; demand ugens inputs
let b = control kr "buf" 100
    r = drandId 'α' dinf (mce [0.95,1,1.05])
    tr = dwhiteId 'β' dinf 0.1 0.3
    sp = dbrownId 'γ' dinf 0 0.95 0.1 * bufFrames kr b
in playBufCF 1 b r tr sp NoLoop 2 5
