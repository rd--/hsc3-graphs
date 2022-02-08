-- playBuf ; requires=buf ; once only
let (b, nc) = (control kr "buf" 0, 2)
in playBuf nc ar b (bufRateScale kr b) 1 0 NoLoop RemoveSynth
