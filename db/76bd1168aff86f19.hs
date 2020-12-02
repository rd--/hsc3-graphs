-- localBuf ; detectIndex example using local buffer
let b = asLocalBuf 'α' [2,3,4,0,1,5]
    n = bufFrames KR b
    x = floorE (mouseX KR 0 n Linear 0.1)
    i = detectIndex b x
in sinOsc AR (linExp i 0 n 200 700) 0 * 0.1
