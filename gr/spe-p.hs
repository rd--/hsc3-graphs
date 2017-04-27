-- spe-p (jmcc)

import Sound.SC3 {- hsc3 -}

import qualified Sound.SC3.Lang.Collection as C {- hsc3-lang -}
import qualified Sound.SC3.Lang.Pattern.Bind as P {- hsc3-lang -}
import qualified Sound.SC3.Lang.Pattern.List as P {- hsc3-lang -}

spe3_allpass6_m :: UId m => m UGen
spe3_allpass6_m = do
  n <- lfNoise1M KR 1
  let fr = control KR "freq" 440
      rapf i = do r <- clone 2 (randM 0 0.05)
                  return (allpassN i 0.05 r 4)
      e = envGen KR 1 0.1 0 1 RemoveSynth (envPerc 0.1 1)
      rq = midiCPS (n * 36 + 110)
      o = rlpf (lfSaw AR fr 0 * e) rq 0.1
  o' <- chainM 4 rapf o
  return (out 0 o')

spe3_allpass6 :: UGen
spe3_allpass6 = uid_st_eval spe3_allpass6_m

spe3_allpass6_sy :: Synthdef
spe3_allpass6_sy = synthdef "spe" spe3_allpass6

lseq1 :: [[a]] -> [a]
lseq1 = concat . C.flop

inf :: Int
inf = maxBound

notes :: Num n => [n]
notes =
    let n = [P.rand' 'α' [[],[24,31,36,43,48,55]] inf
            ,C.flop [[60],P.rand' 'β' [63,65] inf,[67],P.rand' 'γ' [70,72,74] inf]
            ,[P.rand' 'a' [74,75,77,79,81] 3]]
    in concat (lseq1 n)

sc :: NRT
sc = P.sbind1 (spe3_allpass6_sy
              ,[("freq",map midiCPS notes)
               ,("dur",repeat 0.13)])

main :: IO ()
main = nrt_audition sc
