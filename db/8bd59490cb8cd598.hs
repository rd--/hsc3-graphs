-- bufRd ; requires=buf ; mouse control
let nc = 2
    b = control KR "buf" 0
    x = mouseX KR (mce [5, 10]) 100 Linear 0.1
    n = lfNoise1 'α' AR x
in mix (bufRdL nc AR b (n * bufFrames KR b * bufRateScale KR b) Loop)
