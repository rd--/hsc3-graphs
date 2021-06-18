-- https://twitter.com/thormagnusson/status/463992770596577280 (tm) ; texture=overlap,60,15,3,inf
let f i =
      let e = lfnoise2 0.5 * line 0 0.1 (rand 1 99) donothing / (i * 0.2)
      in sinosc (30 * i + lfnoise2 0.1 * 2) 0 * e
in mcefill 2 (\_ -> mixfilloneindexed 24 f)
