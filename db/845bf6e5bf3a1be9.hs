-- localBuf ; detectIndex example using local buffer
let b = asLocalBufId 'α' [2,3,4,0,1,5]
    n = bufFrames kr b
    x = floorE (mouseX kr 0 n Linear 0.1)
    i = detectIndex b x
in sinOsc ar (linExp i 0 n 200 700) 0 * 0.1
