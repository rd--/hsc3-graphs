-- playBuf ; requires=buf ; loop playback, accelerating pitch
let (b, nc) = (control kr "buf" 0, 2)
    r = xLine kr 0.1 100 60 RemoveSynth
in playBuf nc ar b r 1 0 Loop DoNothing
