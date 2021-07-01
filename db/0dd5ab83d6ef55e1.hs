-- bufRd ; requires=buf ; mouse control
let nc = 2
    b = control kr "buf" 0
    x = mouseX kr (mce [5, 10]) 100 Linear 0.1
    n = lfNoise1Id 'α' ar x
in mix (bufRdL nc ar b (n * bufFrames kr b * bufRateScale kr b) Loop)
