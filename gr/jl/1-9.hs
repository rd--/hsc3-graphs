-- <http://sccode.org/1-9> (jl)

import Sound.SC3 {- hsc3 -}

u :: UGen -> UGen
u n =
    let a = hpf (pinkNoise 'α' AR * 0.005) 10 * line KR 0 1 9 DoNothing
        f (z,i) = ringz (a * lfNoise1 z KR (0.05 + rand z 0 0.1)) (55 * (i + n) + 60) 0.2
    in tanh (gVerb (sum (map f (zip ['β' ..] [0 .. 98]))) 70 99 0.5 0.5 15 1 0.7 0.5 300)

u_0 :: UGen -- jl
u_0 = u 0

main :: IO ()
main = audition (u 956)
