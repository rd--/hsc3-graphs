{- PlayBuf ; normal playback at same speed of recording -}
let sf = SfAcquireMono('floating_1');
PlayBuf(1, sf, 1, 0, 0, 1, 0) * 0.25
