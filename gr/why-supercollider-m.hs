import Sound.SC3.Common {- hsc3 -}
import Sound.SC3.UGen.M {- hsc3-m -}

-- > draw why_supercollider
why_supercollider :: UId m => UGen m
why_supercollider =
    let r = resonz (dust AR 0.2 * 50) (rand 200 3200) 0.003
        s = sum (replicate 10 r)
        c = combL (delayN s 0.048 0.048) 0.1 (lfNoise1 KR (rand 0 0.1) * 0.04 + 0.05) 15
        y = sum (replicate 7 c)
        f i = allpassN i 0.05 (mce2 (rand 0 0.05) (rand 0 0.05)) 1
        x = compose_l (replicate 4 f) y
    in s + 0.2 * x

main :: IO ()
main = audition why_supercollider
