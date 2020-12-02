-- localBuf ; asLocalBuf combines localBuf and setBuf
let b = asLocalBuf 'α' [2,1,5,3,4,0]
    x = mouseX KR 0 (bufFrames KR b) Linear 0.2
    f = indexL b x * 100 + 40
in saw AR (f * mce2 1 1.1) * 0.1
