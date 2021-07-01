-- rTracePlay ; traverse a diamond in equal time increments
let t = [0,-1,1/4,0, 1/4,0,1/2,0, 1/2,1,1/4,0, 3/4,0,0,0, 1,-1,1/4,0]
    b = asLocalBufId 'α' t
    o = sinOsc ar 440 0 * 0.1
    l = X.rTracePlay kr b 4 (mouseX kr 1 20 Linear 0.1) 1
in pan2 o l 1
