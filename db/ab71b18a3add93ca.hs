-- recordBuf ; requires=buf ; play recorded buffer back (ie. test)
let b = control KR "buf" 0
in playBuf 1 AR b 1 1 0 NoLoop RemoveSynth
