-- playBuf ; requires=buf ; channel mismatch message in server log ; can acquire second channel (subsequent load)
let nc = 1
    b = control kr "buf" 0
in playBuf (nc + 1) ar b (bufRateScale kr b) 1 0 Loop DoNothing
