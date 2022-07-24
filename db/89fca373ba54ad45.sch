-- https://twitter.com/thormagnusson/status/463992770596577280 (tm) ; texture=overlap, 60, 15, 3, inf
let f i =
      let e = LFNoise2 0.5 * Line 0 0.1 (Rand 1 99) doNothing / (i * 0.2)
      in SinOsc (30 * i + LFNoise2 0.1 * 2) 0 * e
in mceFill 2 (\_ -> mixFillOneIndexed 24 f)
