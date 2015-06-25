-- http://www.fredrikolofsson.com/f0blog/?q=node/617 (f0)

import Sound.SC3 {- hsc3 -}

f0_tw0224 :: UGen
f0_tw0224 =
    let c = 200000
        b = clearBuf (localBuf 'α' 2 c)
        d = bufRd 2 AR b (sinOsc AR (mce2 2 3 * 9) 0 * c) NoLoop LinearInterpolation
        w = bufWr b (abs (sinOsc AR (mce2 99 145) 0) * c) Loop (sinOsc AR (3 / mce2 2 3) 0 / 3)
    in mrg2 d w

main :: IO ()
main = audition (out 0 f0_tw0224)