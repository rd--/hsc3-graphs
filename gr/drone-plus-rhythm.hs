-- drone plus rhythm (jmcc) #12

import Control.Concurrent {- hsc3 -}
import Sound.SC3 {- hsc3 -}
import Sound.SC3.Lang.Control.OverlapTexture {- hsc3-lang -}

scale :: Num a => [a]
scale = [0, 2, 3, 5, 7, 9, 10]

rand2 :: ID a => a -> UGen -> UGen
rand2 z n = rand z (negate n) n

drone_1 :: UGen
drone_1 =
    let f0 = midiCPS (lchoose 'α' [24,36] + rand2 'β' 0.08)
        f1 = lfSaw AR (mce2 f0 (f0 + 0.2)) 0 * lfNoise2 'γ' KR (f0 * mce2 0.05 0.04) * 0.06
    in lpf f1 (rand 'δ' 1000 3000)

drone_1_txt :: IO ()
drone_1_txt = overlapTextureU (4,4,8,maxBound) drone_1

drone_2 :: UGen
drone_2 =
    let x = rand 'ε' 0 1 >* 0.8
        m = lchoose 'ζ' [60,72] + lchoose 'η' scale + uclone 'θ' 2 (rand2 'ι' 0.05)
    in sinOsc AR (midiCPS m) 0 * x * rand 'κ' 0.04 0.07

drone_2_txt :: IO ()
drone_2_txt = overlapTextureU (4,6,3,maxBound) drone_2

iseqr :: ID a => a -> [UGen] -> UGen -> UGen
iseqr z s tr = tr * demand tr 0 (dxrand z dinf (mce s))

rhy :: UGen
rhy =
    let m = lchoose 'λ' [48, 60, 72, 84] + lchoose 'μ' scale + uclone 'ν' 2 (rand2 'ξ' 0.03)
        sq = iseqr 'ο' [0,1,0,1,1,0] (impulse AR (lchoose 'π' [1.5,3,6]) 0)
        sg = lfPulse AR (midiCPS m) 0 0.4 * rand 'ρ' 0.03 0.08
    in rlpf (decay2 sq 0.004 (rand 'σ' 0.2 0.7) * sg) (expRand 'τ' 800 2000) 0.1

pp :: UGen -> UGen
pp z = combN z 0.5 0.5 6 + mceReverse z

rhy_txt :: IO ()
rhy_txt = overlapTextureU_pp (6,6,6,maxBound) rhy 2 pp

main = do
  forkIO drone_1_txt
  forkIO drone_2_txt
  forkIO rhy_txt
