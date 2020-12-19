-- spectralEntropy
let sig = soundIn 0
    amp = amplitude KR sig 0.01 0.01
    chn = fft' (localBuf 'α' 1 1024) sig
    entropy = X.spectralEntropy 10 KR chn 1024 10 * (min amp 0.2) * 5
in splay (blip AR (sqrt entropy * 200) (sqrt entropy)) 1 0.1 0 True
