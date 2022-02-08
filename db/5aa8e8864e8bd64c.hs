-- recordBuf ; requires=buf ; play recorded buffer back (ie. test)
let (b, nc) = (control kr "buf" 0, 1)
in playBuf nc ar b 1 1 0 NoLoop RemoveSynth
