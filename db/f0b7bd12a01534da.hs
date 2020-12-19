-- pv_HainsworthFoote
let i = soundIn 0
    b = localBuf 'α' 2048 1
    f = fft' b i
    x = mouseX KR 0.5 1.25 Linear 0.2
    h = pv_HainsworthFoote f 1 0 x 0.04
    o = sinOsc AR (mrg2 440 445) 0 * decay (h * 0.1) 0.1 * 0.1
in o + i
