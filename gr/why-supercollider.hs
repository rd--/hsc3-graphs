-- why supercollider (jmcc) #0

import Sound.SC3 {- hsc3 -}

import qualified Sound.SC3.UGen.External.RDU as RDU {- sc3-rdu -}

why_supercollider :: UGen
why_supercollider =
    let r = resonz (dust 'α' AR 0.2 * 50) (rand 'β' 200 3200) 0.003
        s = mix (uclone 'γ' 10 r)
        z = delayN s 0.048 0.048
        c = combL z 0.1 (lfNoise1 'δ' KR (rand 'ε' 0 0.1) * 0.04 + 0.05) 15
        y = mix (uclone 'ζ' 7 c)
        f i = allpassN i 0.05 (RDU.randN 2 'η' 0 0.05) 1
        x = useq 'θ' 4 f y
    in s + 0.2 * x

main :: IO ()
main = audition (out 0 why_supercollider)

-- > let dir = "/home/rohan/sw/hsc3-graphs/scsyndef"
-- > synthdefWrite (synthdef "why-supercollider" (out 0 why_supercollider)) dir
