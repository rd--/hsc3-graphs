-- comb delay sweeps (jmcc) #6

import Sound.SC3 {- hsc3 -}
import Sound.SC3.Lang.Control.OverlapTexture {- hsc3-lang -}
import System.Random {- random -}

type ST = (Double,Double,StdGen)

wander :: ST -> ST
wander (s,e,g) =
    let (s',g') = randomR (-7,8) g
        (e',g'') = randomR (-7,8) g'
    in (foldToRange 50 120 (s + s')
       ,foldToRange 50 120 (e + e')
       ,g'')

-- > Sound.SC3.UGen.Dot.draw (fst (cds (60,61,mkStdGen 3567824)))
cds :: ST -> (UGen,ST)
cds st =
    let (s,e,g) = wander st
        l = line KR (constant s) (constant e) 4 DoNothing
        w = whiteNoise 'α' AR * 0.005
        d = 1 / midiCPS l
        c = 1 / midiCPS (constant s)
        o = combC w 0.01 d (c * 1000)
    in (pan2 o (rand 'α' (-1) 1) 1,(s,e,g))

main :: IO ()
main = overlapTextureS (4/3,4/3,9,maxBound) cds (60,61,mkStdGen 3567824)
