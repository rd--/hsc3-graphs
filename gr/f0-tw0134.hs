-- http://sccode.org/1-4Qy (f0)
-- scsynth -u 57110 -w 512

import Sound.SC3

mean :: Fractional a => [a] -> a
mean l = sum l / fromIntegral (length l)

f0_tw0134 :: UGen
f0_tw0134 =
    let a = lfSaw AR
        n' = 50
        n = constant n'
        z i = let o1 = a ((i + 1) / mce [3,4]) 0
                  o2 = a ((i + 1) / 8) 0 + 1
                  f0 = o1 >* o2 * (n / 2) + n
                  m = a ((i + 1) / n) (i / (n / 2))
                  o3 = blip AR f0 (i + mce [2,3]) * m
              in ringz o3 ((i + 1) * (n * 2 - 1)) 0.1
    in mean (map z [0 .. n'])  / 5

main :: IO ()
main = audition (out 0 f0_tw0134)
