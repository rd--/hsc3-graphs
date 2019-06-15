-- drone plus rhythm (jmcc) #12

import Control.Concurrent {- base -}

import Sound.SC3 {- hsc3 -}
import qualified Sound.SC3.UGen.Protect as Protect {- hsc3-rw -}

import qualified Sound.SC3.Lang.Control.OverlapTexture as O {- hsc3-lang -}

import JMcC.Util

dpr_scale :: Num a => [a]
dpr_scale = [0, 2, 3, 5, 7, 9, 10]

dpr_drone_1 :: UGen
dpr_drone_1 =
    let f0 = midiCPS (lchoose 'α' [24,36] + rand2 'β' 0.08)
        f1 = lfSaw AR (mce2 f0 (f0 + 0.2)) 0 * lfNoise2 'γ' KR (f0 * mce2 0.05 0.04) * 0.06
    in lpf f1 (rand 'δ' 1000 3000)

dpr_drone_2 :: UGen
dpr_drone_2 =
    let x = rand 'ε' 0 1 `greater_than` 0.8
        m = lchoose 'ζ' [60,72] + lchoose 'η' dpr_scale + Protect.uclone_all 'θ' 2 (rand2 'ι' 0.05)
    in sinOsc AR (midiCPS m) 0 * x * rand 'κ' 0.04 0.07

dpr_rhy :: UGen
dpr_rhy =
    let m = lchoose 'λ' [48, 60, 72, 84] + lchoose 'μ' dpr_scale + Protect.uclone_all 'ν' 2 (rand2 'ξ' 0.03)
        sq = isequX 'ο' [0,1,0,1,1,0] (impulse AR (lchoose 'π' [1.5,3,6]) 0)
        sg = lfPulse AR (midiCPS m) 0 0.4 * rand 'ρ' 0.03 0.08
    in rlpf (decay2 sq 0.004 (rand 'σ' 0.2 0.7) * sg) (expRand 'τ' 800 2000) 0.1

dpr_rhy_pp :: UGen -> UGen
dpr_rhy_pp z = combN z 0.5 0.5 6 + mceReverse z

dpr_ot :: IO [ThreadId]
dpr_ot = do
  t1 <- forkIO (O.overlapTextureU_pp (6,6,6,maxBound) dpr_rhy 2 dpr_rhy_pp)
  t2 <- forkIO (O.overlapTextureU (4,4,8,maxBound) dpr_drone_1)
  t3 <- forkIO (O.overlapTextureU (4,6,3,maxBound) dpr_drone_2)
  return [t1,t2,t3]

dpr_ot_ :: IO ()
dpr_ot_ = dpr_ot >> return ()

main :: IO ()
main = dpr_ot_
