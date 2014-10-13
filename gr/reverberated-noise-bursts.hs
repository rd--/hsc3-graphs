-- reverberated noise bursts (jmcc) #3

import Sound.SC3 {- hsc3 -}

rnb :: UGen
rnb =
    let s = decay (dust 'α' AR 0.6 * 0.2) 0.15 * pinkNoise 'β' AR
        z = delayN s 0.048 0.048
        y = mix (combL z 0.1 (lfNoise1 'γ' KR (uclone 'δ' 6 (rand 'ε' 0 0.1)) * 0.04 + 0.05) 15)
        f = useq 'ζ' 4 (\i -> allpassN i 0.050 (uclone 'η' 2 (rand 'θ' 0 0.05)) 1)
    in s + f y

main :: IO ()
main = audition (out 0 rnb)
