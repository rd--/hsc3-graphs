-- https://twitter.com/thormagnusson/status/463992770596577280 (tm) ; texture=overlap,60,15,3,inf ; id
let f z i =
      let x = constant i + 1
          e = lfNoise2Id z ar 0.5 * line ar 0 0.1 (randId z 1 99) DoNothing / (x * 0.2)
      in sinOsc ar (30 * x + lfNoise2Id z ar 0.1 * 2) 0 * e
in mceFillId 'α' 2 (\z _ -> mixFillId z 24 f)
