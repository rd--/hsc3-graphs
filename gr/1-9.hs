-- http://sccode.org/1-9

import Sound.SC3 {- hsc3 -}

k :: Enum a => a -> Int -> [Int]
k c n = let i = fromEnum c in [i .. i + n]

u :: UGen
u =
    let a = hpf (pinkNoise 'α' AR * 0.005) 10 * line KR 0 1 9 DoNothing
        f i = let i' = constant i
              in ringz (a * lfNoise1 i KR (0.05 + rand i 0 0.1)) (55 * i' + 60) 0.2
    in tanh (gVerb (sum (map f (k 'β' 98))) 70 99 0.5 0.5 15 1 0.7 0.5 300)

main :: IO ()
main = audition (out 0 u)
