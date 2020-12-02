-- rPlayTrace ; X of trace is (-1 0 1 0 -1) ; Y is (1/4 1/2 1/4 0 1/4)
let t = [0,-1,1/4,0, 1/4,0,1/2,0, 1/2,1,1/4,0, 3/4,0,0,0, 1,-1,1/4,0]
    b = asLocalBuf 'α' t
    o = sinOsc AR 440 0 * 0.1
    tr f n = X.rPlayTrace KR b 4 (f KR 1 20 Linear 0.1) n
    l = tr mouseX 1
    g = tr mouseY 2
in pan2 o l g
