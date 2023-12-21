-- https://twitter.com/thormagnusson/status/463992770596577280 (tm) ; texture=overlap, 60, 15, 3, inf
let f i =
      let e = LfNoise2 0.5 * Ln 0 0.1 (Rand 1 99) / (i * 0.2)
      in SinOsc (30 * i + LfNoise2 0.1 * 2) 0 * e
    g () = mixFillOneIndexed 24 f
in g ! 2
