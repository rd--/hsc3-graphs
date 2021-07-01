-- recordBuf ; requires=buf ; play recorded buffer back (ie. test)
let b = control kr "buf" 0
in playBuf 1 ar b 1 1 0 NoLoop RemoveSynth
