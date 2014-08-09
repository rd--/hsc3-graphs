-- https://twitter.com/headcube/status/289761321065541633 (nv)

import Sound.SC3 {- hsc3 -}
import Sound.SC3.Lang.Collection {- hsc3-lang -}

mce_concat :: [UGen] -> UGen
mce_concat = mce . concat . map mceChannels

mce_rotate :: Integral i => i -> UGen -> UGen
mce_rotate n = mce . rotate n . mceChannels

-- > length (mceChannels nv_tw_2013_01_11) == 100
nv_tw_2013_01_11 :: UGen
nv_tw_2013_01_11 =
    let nc = 80
        i = inFeedback nc 20
        n = (uclone 'α' nc (lfNoise1 'β' KR 1e-3 + 1)) / constant nc
        j = combL (lpf i 2e3) 1 n 0.05
        d = uclone 'γ' nc (dust2 'δ' AR 0.01)
        x = sin (j + d)
    in mce_concat [splay x 1 1 0 True
                  ,mce (replicate 18 0)
                  ,(x - mce_rotate 1 x) / 2]

main :: IO ()
main = audition (out 0 nv_tw_2013_01_11)

main_w :: IO ()
main_w = do
  let sy = synthdef "nv_tw_2013_01_11" (out 0 nv_tw_2013_01_11)
  synthdefWrite sy "/tmp"
  withSC3 (do _ <- async (d_load "/tmp/nv_tw_2013_01_11.scsyndef")
              send (s_new "nv_tw_2013_01_11" (-1) AddToTail 1 []))
