-- playBuf ; requires=buf ; loop playback, accelerating pitch
let nc = 2
    b = control kr "buf" 0
    r = xLine kr 0.1 100 60 RemoveSynth
in playBuf nc ar b r 1 0 Loop DoNothing
