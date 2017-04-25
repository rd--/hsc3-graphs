-- mridangam (jmcc) #SPE3

import Sound.SC3 {- hsc3 -}

import qualified Sound.SC3.Graphs.JMcC as JMcC {- hsc3-lang -}

-- > let g = drum (dust 'α' AR 1)
-- > audition (out 0 g)
drum :: UGen -> UGen
drum a =
    let n = whiteNoise 'α' AR * 70
        e = decay2 a 0.002 0.1
    in distort (resonz (n * e) (midiCPS 60) 0.02 * 4) * 0.4

drone :: UGen
drone =
    let s1 = saw AR (midiCPS (mce2 60 60.04))
        s2 = saw AR (midiCPS (mce2 67 67.04))
    in lpf (s1 + s2) (midiCPS 108) * 0.007

lseq :: [Double] -> UGen -> UGen
lseq l n = dseq 'β' n (mce (map constant l))

lrand :: [[Double]] -> UGen -> UGen
lrand l n = drand 'γ' n (mce (map (flip lseq 1) l))

a_seq :: [UGen]
a_seq = JMcC.mri_a_seq lseq lrand

mridangam :: UGen
mridangam = drum (tDuty AR (1 / 8) 0 DoNothing (dseq 'δ' 1 (mce a_seq)) 0) + drone

main :: IO ()
main = audition (out 0 mridangam)
