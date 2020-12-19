-- spectralEntropy ; note numChannels and numBands must be equal
let sig = soundIn 0
    chn = fft' (localBuf 'α' 1 2048) sig
    entropy = X.spectralEntropy 1 KR chn 2048 1
in pan2 (blip AR 100 (sqrt entropy * 10)) 0 0.1
