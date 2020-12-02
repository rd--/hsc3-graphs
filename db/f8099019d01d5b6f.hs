-- bufFrames ; requires=buf ; mouse location drags play head
let b = control KR "buf" 0
    r = mce [0.05,0.075 .. 0.15]
    p = k2a (mouseX KR 0 (bufFrames KR b) Linear r)
in mix (bufRdL 1 AR b p NoLoop) * 0.1
