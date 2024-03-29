-- https://twitter.com/thormagnusson/status/463992770596577280 (tm) ; texture=overlap,60,15,3,inf
let f i =
      let x = constant i + 1
          e = lfNoise2 ar 0.5 * line ar 0 0.1 (rand 1 99) DoNothing / (x * 0.2)
      in sinOsc ar (30 * x + lfNoise2 ar 0.1 * 2) 0 * e
in mceFill 2 (\_ -> mixFill 24 f)
