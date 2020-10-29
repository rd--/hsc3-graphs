-- http://sccode.org/1-4QO (cmn)

import Sound.SC3 {- hsc3 -}
import Sound.SC3.Lang.Control.OverlapTexture {- hsc3-lang -}

-- > audition (out 0 nx102)
nx102 :: UGen
nx102 =
    let r = rand 'α' 50 100
        b = playBuf 1 KR 1 r 1 0 Loop DoNothing
        f = clip (b * rand 'β' 100 1000) (rand 'γ' 5 12) (rand 'δ' 12 20)
        o = pulse AR f 0.5
        lrf = rand 'ε' 100 5000
        lrq = rand 'ζ' 0.005 0.1
        hrf = rand 'η' 5000 20000
        hrq = rand 'θ' 0.005 0.1
        s = rhpf (rlpf o lrf lrq) hrf hrq
        v = freeVerb s 0 0 0
        pk i n k = bPeakEQ i n 6.0 k
        q = pk (pk (pk (pk v 100 6) 1000 0) 5000 0) 10000 6
    in pan2 (leakDC (normalizer q 1.25 0.1) 0) 0 1

main :: IO ()
main =
    let fn = "/home/rohan/data/audio/pf-c5.aif"
        ac = do _ <- async (b_allocRead 1 fn 0 0)
                nrt_play (overlapTexture_nrt (1,0) (6,3,9,maxBound) nx102)
    in withSC3 ac
