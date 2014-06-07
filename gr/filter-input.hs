-- filter input (jmcc)

import Sound.SC3

filter_input :: UGen
filter_input =
    let rQ = mouseY KR 0.01 1 Exponential 0.2 -- bandwidth ratio = 1/Q
        cf = mouseX KR 100 12000 Exponential 0.2 -- mouse x controls cutoff freq
        sg = soundIn (mce2 0 1) * 0.4 * sqrt rQ -- attenuate to offset resonance
    in rlpf sg cf rQ

main :: IO ()
main = audition (out 0 filter_input)
