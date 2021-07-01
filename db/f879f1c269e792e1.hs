-- modDif ; different moduli
let sig = lfSaw ar 10 0
    dist = modDif sig 0 (mce [0..8] * mouseX kr 0 (1/5) Linear 0.2)
in splay (sinOsc ar (dist * 4000 + 400) 0) 1 1 0 True * 0.1
