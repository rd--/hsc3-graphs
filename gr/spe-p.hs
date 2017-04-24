-- spe-p (jmcc)

import Sound.SC3 {- hsc3 -}
import Sound.SC3.Common.Monad {- hsc3 -}
import qualified Sound.SC3.Lang.Collection as C {- hsc3-lang -}
import qualified Sound.SC3.Lang.Pattern.Bind as P {- hsc3-lang -}
import qualified Sound.SC3.Lang.Pattern.List as P {- hsc3-lang -}

spe3_allpass6 :: UId m => m Synthdef
spe3_allpass6 = do
  n <- lfNoise1M KR 1
  let fr = control KR "freq" 440
      rapf i = do r <- clone 2 (randM 0 0.05)
                  return (allpassN i 0.05 r 4)
      e = envGen KR 1 0.1 0 1 RemoveSynth (envPerc 0.1 1)
      rq = midiCPS (n * 36 + 110)
      o = rlpf (lfSaw AR fr 0 * e) rq 0.1
  u <- fmap (out 0) (chainM 4 rapf o)
  return (synthdef "spe" u)

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

main :: IO ()
main = do
  i <- spe3_allpass6
  audition (P.sbind1 (i,[("freq",map midiCPS notes),("dur",repeat 0.13)]))
