-- http://www.fredrikolofsson.com/f0blog/?q=node/617

import Sound.SC3 {- hsc3 -}

f0_tw0220 :: UGen
f0_tw0220 =
    let c = inFeedback 1 0
        b = clearBuf (localBuf 'α' 1 90000)
        g = tGrains 2 (sinOsc AR 3 0) b (c + 3) 2 12 0 0.1 4
        r = recordBuf AR b 0 1 0 1 Loop 1 DoNothing c
    in mrg2 (hpf (sinOsc AR 99 (c * 6) / 9 + g) 9) r

main :: IO ()
main = withSC3 (play (out 0 f0_tw0220))

{-
2014-10-11: tgrains needs a patch to work with localbuf
http://article.gmane.org/gmane.comp.audio.supercollider.user/110110
main = withSC3 (async (b_alloc bufnum 90000 1) >> play (out 0 f0_tw0220))
-}
