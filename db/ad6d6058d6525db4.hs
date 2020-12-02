-- playBuf ; requires=buf ; infinite loop
let nc = 2
    b = control KR "buf" 0
in playBuf nc AR b (bufRateScale KR b) 1 0 Loop DoNothing
