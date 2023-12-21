-- bufRd ; requires=buf ; mouse control
let (buf, nc) = (control kr "buf" 100, 2)
    x = mouseX kr (mce [5, 10]) 100 Linear 0.1
    n = lfNoise1Id 'α' ar x
in mix (bufRdL nc ar buf (n * bufFrames kr buf * bufRateScale kr buf) Loop)
