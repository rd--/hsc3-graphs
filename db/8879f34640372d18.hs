-- sonLPC
let nf = 1024 * 2
    hop = 1 / 4
    poles = mouseY kr 4 80 Linear 0.2 -- MAXPOLES=80
    sig = soundIn 0
    chain = X.sonLPC ar (localBufId 'α' 1 nf) sig hop poles
    freq = mouseX kr 50 200 Linear 0.2
    exci = saw ar freq
in pan2 (X.sonLPCSynthIn ar chain exci) 0 1
