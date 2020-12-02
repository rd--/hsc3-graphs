-- bufFrames ; requires=buf ; read without loop, trigger reset based on buffer duration
let b = control KR "buf" 0
    p = phasor AR 0 (bufRateScale KR b) 0 (bufFrames KR b) 0
in bufRdL 1 AR b p NoLoop * 0.1
