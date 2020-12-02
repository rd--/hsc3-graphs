-- playBuf ; requires=buf ; channel mismatch message in server log ; can acquire second channel (subsequent load)
let nc = 1
    b = control KR "buf" 0
in playBuf (nc + 1) AR b (bufRateScale KR b) 1 0 Loop DoNothing
