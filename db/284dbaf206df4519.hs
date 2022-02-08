-- bGenSin1Tbl ; bufRd
let tbl = bGenSine1Tbl ("tbl", 0, 8192) [1, 1/2, 1/3, 1/4, 1/5]
    x = mouseX kr 220 440 Exponential 0.2
    phase = linLin (lfSaw ar x 0) (-1) 1 0 1 * bufFrames kr tbl
in bufRdC 1 ar tbl phase Loop * 0.1
