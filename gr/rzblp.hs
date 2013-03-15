-- rzblp (rd)

import Sound.SC3.ID {- hsc3 -}

lfn :: ID a => a -> UGen -> UGen -> UGen -> UGen
lfn z f l r =
    let z' = z `joinID` l `joinID` r
    in range l r (lfNoise0 z' KR f)

hpb :: (ID a) => a -> UGen -> UGen
hpb z q =
    let g i = let z' = idHash z + i
                  f = lfn z' q 1330 1395
                  a = lfn z' q 0.001 0.007
              in blip AR f 24 * a
    in mixFill 2 g

mk_f :: ID a => a -> (a -> UGen -> UGen -> UGen) -> UGen
mk_f z d =
    let q = lfn z 5.2 5.2 5.21
        a = d z dinf (mce [1,3,2,7,8])
        tr = impulse KR q 0
        freq = demand tr 0 a * 30 + 340
        rt = impulse AR q (mce2 0 0)
        rf = lfn z 5 30 640
        rbw = lfn z q 0.1 0.5
    in sum [blip AR freq 3 * lfn z q 0.001 0.01
           ,resonz rt rf rbw * lfn z q 0.01 1.8
           ,hpb z q * lfn z q 1.2 1.8
           ,blip AR (lfn z q 16 36) 3 * mce2 0.03 0.09]

rzblp :: UGen
rzblp = mk_f 'α' drand + mk_f 'β' dxrand

main :: IO ()
main = audition (out 0 rzblp)
