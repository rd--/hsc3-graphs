-- spe-p (jmcc)

import Sound.SC3.Monadic {- hsc3 -}
import Sound.SC3.Lang.Pattern.ID {- hsc3-lang -}

spe3_allpass6 :: IO Synthdef
spe3_allpass6 = do
  n <- lfNoise1 KR 1
  let freq = control KR "freq" 440
      (>=>) f g = \x -> f x >>= g
      chain i f = foldl (>=>) return (replicate i f)
      rapf i = do r <- clone 2 (rand 0 0.05)
                  return (allpassN i 0.05 r 4)
      e = envGen KR 1 0.1 0 1 RemoveSynth (envPerc 0.1 1)
      rq = midiCPS (n * 36 + 110)
      o = rlpf (lfSaw AR freq 0 * e) rq 0.1
  u <- chain 4 rapf o >>= return . out 0
  return (synthdef "spe" u)

notes :: P Double
notes =
    let n = [prand' 'a' [pempty,fromList [24,31,36,43,48,55]] inf
            ,pflop [60,prand 'b' [63,65] inf,67,prand 'c' [70,72,74] inf]
            ,psplitPlaces (pwhite 'd' 3 9 inf) (fromList [74,75,77,79,81])]
    in pjoin (pseq1 n inf)

main :: IO ()
main = do
  i <- spe3_allpass6
  audition (i,pbind [("midinote",notes),("dur",0.13)])
