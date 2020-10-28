-- rzblp (rd,2006-09-10)

import Sound.SC3 {- hsc3 -}
import Sound.SC3.Common.Monad.Operators {- hsc3 -}

lfn :: ID a => a -> UGen -> Double -> Double -> UGen
lfn z f l r = range (constant l) (constant r) (lfNoise0 z KR f)

hpb :: ID a => a -> UGen -> UGen
hpb z q =
    let g :: Int -> UGen
        g i = let z' = (z,i)
                  f = lfn (z','α') q 1330 1395
                  a = lfn (z','β') q 0.001 0.007
              in blip AR f 24 * a
    in mixFill 2 g

mk_f :: ID a => a -> (a -> UGen -> UGen -> UGen) -> UGen
mk_f z d =
    let q = lfn (z,'γ') 5.2 5.2 5.21
        a = d z dinf (mce [1,3,2,7,8])
        tr = impulse KR q 0
        freq = demand tr 0 a * 30 + 340
        rt = impulse AR q (mce2 0 0)
        rf = lfn (z,'ε') 5 30 640
        rbw = lfn (z,'ζ') q 0.1 0.5
    in sum [blip AR freq 3 * lfn (z,'η') q 0.001 0.01
           ,resonz rt rf rbw * lfn (z,'θ') q 0.01 1.8
           ,hpb (z,'ι') q * lfn (z,'κ') q 1.2 1.8
           ,blip AR (lfn (z,'λ') q 16 36) 3 * mce2 0.03 0.09]

rzblp :: UGen
rzblp = mk_f 'μ' drand + mk_f 'ν' dxrand

main :: IO ()
main = audition (out 0 rzblp)

-- * M

lfn_m :: UId m => UGen -> UGen -> UGen -> m UGen
lfn_m f l r = fmap (range l r) (lfNoise0M KR f)

hpb_m :: UId m => UGen -> m UGen
hpb_m q =
    let g :: UId m => Int -> m UGen
        g _ = do f <- lfn_m q 1330 1395
                 a <- lfn_m q 0.001 0.007
                 return (blip AR f 24 * a)
    in mixFillM 2 g

mk_f_m :: UId m => (UGen -> UGen -> m UGen) -> m UGen
mk_f_m d = do
  q <- lfn_m 5.2 5.2 5.21
  a <- d dinf (mce [1,3,2,7,8])
  let freq = demand (impulse KR q 0) 0 a * 30 + 340
  s1 <- blip AR freq 3 *. lfn_m q 0.001 0.01
  s2 <- do f <- lfn_m 5 30 640
           bw <- lfn_m q 0.1 0.5
           resonz (impulse AR q (mce2 0 0)) f bw *. lfn_m q 0.01 1.8
  s3 <- hpb_m q .*. lfn_m q 1.2 1.8
  s4 <- do f <- lfn_m q 16 36
           return (blip AR f 3 * mce2 0.03 0.09)
  return (sum [s1,s2,s3,s4])

rzblp_m :: UId m => m UGen
rzblp_m = mk_f_m drandM .+. mk_f_m dxrandM

main_m :: IO ()
main_m = audition . out 0 =<< rzblp_m
