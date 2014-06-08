-- ring modulate input (jmcc)

import Sound.SC3

ring_modulate_input :: UGen
ring_modulate_input =
    let input = soundIn (mce2 0 1)
        x = mouseX KR 10 4000 Exponential 0.2 -- mouse x controls ring mod freq
        modulator = sinOsc AR x (mce2 0 (0.5 * pi)) -- offset phase of one osc by 90 degrees
    in input * modulator

main :: IO ()
main = audition (out 0 ring_modulate_input)
