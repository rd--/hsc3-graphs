-- rzblp-m (rd)

import Sound.SC3 {- hsc3 -}
import Sound.SC3.Common.Monad.Operators {- hsc3 -}

lfn :: UId m => UGen -> UGen -> UGen -> m UGen
lfn f l r = fmap (range l r) (lfNoise0M KR f)

hpb :: UId m => UGen -> m UGen
hpb q =
    let g :: UId m => Int -> m UGen
        g _ = do f <- lfn q 1330 1395
                 a <- lfn q 0.001 0.007
                 return (blip AR f 24 * a)
    in mixFillM 2 g

mk_f :: UId m => (UGen -> UGen -> m UGen) -> m UGen
mk_f d = do
  q <- lfn 5.2 5.2 5.21
  a <- d dinf (mce [1,3,2,7,8])
  let freq = demand (impulse KR q 0) 0 a * 30 + 340
  s1 <- blip AR freq 3 *. lfn q 0.001 0.01
  s2 <- do f <- lfn 5 30 640
           bw <- lfn q 0.1 0.5
           resonz (impulse AR q (mce2 0 0)) f bw *. lfn q 0.01 1.8
  s3 <- hpb q .*. lfn q 1.2 1.8
  s4 <- do f <- lfn q 16 36
           return (blip AR f 3 * mce2 0.03 0.09)
  return (sum [s1,s2,s3,s4])

rzblp :: UId m => m UGen
rzblp = mk_f drandM .+. mk_f dxrandM

main :: IO ()
main = audition . out 0 =<< rzblp
