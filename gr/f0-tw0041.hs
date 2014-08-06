-- http://www.fredrikolofsson.com/f0blog/?q=node/537

import Sound.SC3 {- hsc3 -}

f0_tw0041 :: UGen
f0_tw0041 =
    let s = sweep (localIn' 6 AR) 1
        i = impulse AR (mce [1,0.749,6,12,3,4]) 0
        o = sinOsc AR (1 / runningMax s i) 0
    in mrg [tanh (splay o 1 1 0 True) / 2 * 0.1
           ,localOut o]

main :: IO ()
main = audition (out 0 f0_tw0041)

