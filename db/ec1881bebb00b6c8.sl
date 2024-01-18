{- SfPlay ; mouse controls playback rate and re-trigger interval ; loop -}
let sf = SfAcquireMono('floating_1');
let rateMultiplier = MouseX(0.25, 4, 1, 0.2);
SfPlay(sf, rateMultiplier, 1, 0, 1)
