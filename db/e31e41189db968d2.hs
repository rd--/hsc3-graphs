-- localBuf ; asLocalBuf combines localBuf and setBuf
let b = asLocalBuf [2,1,5,3,4,0]
    x = mouseX kr 0 (bufFrames kr b) Linear 0.2
    f = indexL b x * 100 + 40
in saw ar (f * mce2 1 1.1) * 0.1
