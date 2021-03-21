-- sonLPC
let nf = 1024 * 2
    hop = 1 / 4
    poles = mouseY KR 4 80 Linear 0.2 -- MAXPOLES=80
    sig = soundIn 0
    chain = X.sonLPC AR (localBuf 'α' 1 nf) sig hop poles
    freq = mouseX KR 50 200 Linear 0.2
    exci = saw AR freq
in pan2 (X.sonLPCSynthIn AR chain exci) 0 1
