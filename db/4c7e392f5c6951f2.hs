-- playBuf ; requires=buf ; infinite loop
let nc = 2
    b = control kr "buf" 0
in playBuf nc ar b (bufRateScale kr b) 1 0 Loop DoNothing
