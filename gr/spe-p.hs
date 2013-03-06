-- spe-p (jmcc)

import Sound.SC3.Monad {- hsc3 -}
import Sound.SC3.Lang.Pattern.ID {- hsc3-lang -}

spe3_allpass6 :: UId m => m Synthdef
spe3_allpass6 = do
  n <- lfNoise1 KR 1
  let freq = control KR "freq" 440
      (>=>) f g x = f x >>= g
      chain i f = foldl (>=>) return (replicate i f)
      rapf i = do r <- clone 2 (rand 0 0.05)
                  return (allpassN i 0.05 r 4)
      e = envGen KR 1 0.1 0 1 RemoveSynth (envPerc 0.1 1)
      rq = midiCPS (n * 36 + 110)
      o = rlpf (lfSaw AR freq 0 * e) rq 0.1
  u <- fmap (out 0) (chain 4 rapf o)
  return (synthdef "spe" u)

notes :: P Double
notes =
    let n = [prand' 'α' [pempty,fromList [24,31,36,43,48,55]] inf
            ,pflop [60,prand 'β' [63,65] inf,67,prand 'γ' [70,72,74] inf]
            ,psplitPlaces (pwhite 'δ' 3 9 inf) (fromList [74,75,77,79,81])]
    in pjoin (pseq1 n inf)

main :: IO ()
main = do
  i <- spe3_allpass6
  audition (i,pbind [("midinote",notes),("dur",0.13)])
