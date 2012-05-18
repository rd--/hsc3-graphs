-- www.fredrikolofsson.com/f0blog/?q=node/537

import Sound.SC3

f0_0045 :: UGen
f0_0045 =
    let a i j k l = sinOsc AR i j * k + l
        f = a (a 0.11 0 1 0) 0 1 0
        p_f = a (95 * a 0.01 0 1 1) 0 (a 5e-3 0 50 0) 100
        p = a p_f (a (mce2 98 97) 0 1 0) (pi + a 5e-4 0 1 0) 0
    in out 0 (tanh (a f p 1 0))

main :: IO ()
main = audition f0_0045