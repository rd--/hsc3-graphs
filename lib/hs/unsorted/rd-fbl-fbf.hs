-- fbl-fbf (rd)

import Sound.SC3 {- hsc3 -}

fbl :: UGen -> [UGen] -> [UGen] -> [UGen] -> (UGen, UGen)
fbl l i d g =
    let a0 = l + mce i
        a1 = delayL a0 (maximum d) (mce d)
    in (localOut (a1 * mce g),a1)

fbf :: [UGen] -> [UGen] -> [UGen] -> [UGen] -> (UGen, UGen)
fbf b i d g =
    let a0 = inFeedback 1 (mce b) + mce i
        a1 = delayL a0 (maximum d) (mce d)
    in (offsetOut (mce b) (mce [a1 * mce g]),a1)

fbl_fbf :: UGen
fbl_fbf =
  let n = brownNoise 'α' AR
      e = decay (impulse AR 0.3 0) 0.1 * n * 0.2
      c = 4
      e' = replicate c e
      b0 = [24,26,28,30]
      d0 = [0.1,0.3,0.5,0.7]
      g0 = [0.8,0.6,0.4,0.2]
      b1 = [25,27,29,31]
      d1 = [0.2,0.3,0.6,0.7]
      g1 = [0.8,0.7,0.4,0.3]
      (u0,s0) = fbl (localIn' c AR) e' d0 g0
      (u1,s1) = fbf b0 e' d0 g0
      (u2,s2) = fbf b1 (mceChannels s1) d1 g1
      o = mce [mix (s0 + s1),mix s2]
  in mrg [u0,u1,u2,offsetOut 0 o]

main :: IO ()
main = withSC3 (reset >> play fbl_fbf)
