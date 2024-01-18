{- SfPlay ; normal playback at same speed of recording ; loop ; requires=SfAcquire -}
let sf = SfAcquireMono('floating_1');
SfPlay(sf, 1, 1, 0, 1)
