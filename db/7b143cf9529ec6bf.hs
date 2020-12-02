-- modDif ; different moduli
let sig = lfSaw AR 10 0
    dist = modDif KR sig 0 (mce [0..8] * mouseX KR 0 (1/5) Linear 0.2)
in splay (sinOsc AR (dist * 4000 + 400) 0) 1 1 0 True * 0.1
