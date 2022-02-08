-- bufFrames ; requires=buf ; mouse location drags play head
let (b, nc) = (control kr "buf" 0, 2)
    r = mce [0.05, 0.075 .. 0.15]
    p = k2a (mouseX kr 0 (bufFrames kr b) Linear r)
in mix (bufRdL nc ar b p NoLoop) * 0.1
