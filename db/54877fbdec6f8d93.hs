-- playBuf ; requires=buf ; loop playback, accelerating pitch
let nc = 2
    b = control KR "buf" 0
    r = xLine KR 0.1 100 60 RemoveSynth
in playBuf nc AR b r 1 0 Loop DoNothing
