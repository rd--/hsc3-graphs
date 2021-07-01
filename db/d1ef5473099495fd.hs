-- warp1 ; real-time (delayed) input, localBuf
let sz = 8192
    b = clearBuf (localBufId 'α' 1 sz)
    i = soundIn 0
    r = recordBuf ar b 0 1 0 1 Loop 1 DoNothing i
    ph = (sz / sampleRate) * 2 * pi
    p = lfSaw kr (1 / bufDur kr b) ph * 0.5 + 0.5
    x = mouseX kr 0.5 2 Linear 0.2
    y = mouseY kr 0.01 0.2 Linear 0.2
    w = warp1 1 b p x 0.1 (-1) 8 y 4
in mrg2 (i + w) r
