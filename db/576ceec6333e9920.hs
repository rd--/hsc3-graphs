-- recordBuf ; requires=buf ; record for four seconds (until end of buffer)
let b = control KR "buf" 0
    o = formant AR (xLine KR 400 1000 4 DoNothing) 2000 800 * 0.125
in mrg2 o (recordBuf AR b 0 1 0 1 NoLoop 1 RemoveSynth o)
