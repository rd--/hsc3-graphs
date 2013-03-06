-- half-life (jrhb)

import Sound.SC3.ID {- hsc3 -}

half_life :: UGen
half_life =
  let t_half = 1/3.92
      n_atoms = 1e+5
      n = max 0 (n_atoms - pulseCount (localIn 2 AR) 0)
      activity = dust 'α' AR (n * log 2 * t_half)
  in mrg [activity,localOut activity]

main :: IO ()
main = audition (out 0 half_life)
