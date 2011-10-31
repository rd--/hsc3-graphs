-- rzblp (rd)

import Sound.SC3 {- hsc3 -}
import Sound.SC3.UGen.Unsafe {- hsc3-unsafe -}

rzblp :: UGen
rzblp =
  let wrp i l r = let m = (r - l) / 2
                  in i * m + l + m
      lfn f = wrp (lfNoise0 KR f)
      hpb q = mixFill 2 (\_ -> let f = lfn q 1330 1395
                                   a = lfn q 0.001 0.007
                               in blip AR f 24 * a)
      mk_f d = let q = lfn 5.2 5.2 5.21
                   a = d dinf (mce [1,3,2,7,8])
                   tr = impulse KR q 0
                   freq = demand tr 0 a * 30 + 340
               in sum [blip AR freq 3 * lfn q 0.001 0.01
                      ,resonz (impulse AR q (mce2 0 0))
                                  (lfn 5 30 640)
                                  (lfn q 0.1 0.5) * lfn q 0.01 1.8
                      ,hpb q * lfn q 1.2 1.8
                      ,blip AR (lfn q 16 36) 3 * mce2 0.03 0.09]
  in mk_f drand + mk_f dxrand

main :: IO ()
main = audition (out 0 rzblp)
