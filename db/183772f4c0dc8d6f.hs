-- rPlayTrace ; traverse a diamond in equal time increments
let t = [0,-1,1/4,0, 1/4,0,1/2,0, 1/2,1,1/4,0, 3/4,0,0,0, 1,-1,1/4,0]
    b = asLocalBuf 'α' t
    o = sinOsc AR 440 0 * 0.1
    l = X.rPlayTrace KR b 4 (mouseX KR 1 20 Linear 0.1) 1
in pan2 o l 1
