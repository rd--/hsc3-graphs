module F0 where

import Data.Bits {- base -}
import Data.List {- base -}

import Sound.SC3 {- hsc3 -}

-- * TW

-- | <https://twitter.com/redFrik/status/1136928201886904320>
f0_tw_1136928201886904320 :: UGen
f0_tw_1136928201886904320 =
  let gt = greater_than
      f a i =
        let b = mce [4,2,1,3,5]
            c = roundTo (a AR (1/b) 0 * b) (a AR (b/9) 0 `gt` 0)
            o = sinOscFB AR (c ** 2 * ((a AR 0.02 i `gt` 0) + 1 * 50)) (a AR (c/9) 0 `modE` 1)
            s = o * max (a AR (1/b * a AR (b/99) i) 0) 0 * a AR 0.01 i
            x = allpassC s 1 (wrap c 0.5 1) 2
            y = bpf x (i * 99 + 400) 0.001 * (a AR 0.04 i + 1 * 9)
        in splay (x + y) 1 1 0 True / 3
  in sum (zipWith f [lfTri,lfSaw,lfPar] [0..])

-- | <https://twitter.com/redFrik/status/1138498427241861122> (f0)
f0_tw_1138498427241861122 :: UGen
f0_tw_1138498427241861122 =
  let f = sqrt 9
      b = mce2 f 9.999
      e = pitchShift
      a = sinOscFB
      d = max (a AR (b/99) 0) 0
      t1 = ugen_if (a AR (a AR (9/999) 0) 0 `greater_than` a AR (9/99) 0) f (9/b)
      t2 = ugen_if (a AR (9/99) 0 `less_than` a AR (99/9999) 0) (b/9) f
      f1 = lag (9.9 * b * t1 * t2) 0.1
      s1 = a AR f1 d * a AR (b/9) 0 * d
      c = e s1 (9 / b) (9 / sqrt b) (b / 999) (b / 99)
      s2 = gVerb (c * d * d * d) 99 9 (9/999) 0.5 15 1 0.7 0.5 300
      s3 = s2 / 9 + e c (f/9) (f/9) 0 0
  in hpf (splay s3 1 1 0 True) 9

-- | <https://twitter.com/redFrik/status/454598285861617665> (f0)
f0_tw_454598285861617665 :: UGen
f0_tw_454598285861617665 =
    let b = mce [9,8 .. 1]
        c = lfTri AR (3 ** lfTri AR (1 / b) (b / 9)) 0
        d = lfTri AR (1 / b) 0 `modE` 1 / 9 + 0.01
        f = 2 ** roundE (lfTri AR (b / 99) 0) * 99 * b
        o = grainSin 2 c d f 0 (-1) 512
    in splay (tanh o) 1 1 0 True / 2

-- | <https://twitter.com/redFrik/status/456384156159574016> (f0)
f0_tw_456384156159574016 :: UGen
f0_tw_456384156159574016 =
    let a = 1 / mce [3,12,4,1,6,2]
        s = lag3 (sinOsc AR a 0) (abs (sinOsc AR (2.67 ** a) 0)) * 99
        f = ((sinOsc AR ((1 / a) / 9) a `greater_than` 0) * 20 + 99) / a
    in splay (sinOsc AR (hpf (ringz s f 1) 440) 0) 1 1 0 True * 0.25

-- | <http://fredrikolofsson.com/f0blog/?q=node/478> (f0)
f0_tw0014 :: UGen
f0_tw0014 =
    let a = sinOscFB AR
        k = 1/9
        f i = let a0 = a (i+1) k * 999
                  a1 = a k 1 * k
                  a2 = a a0 k * a1
                  a3 = a 0.1 3
                  a4 = a a2 a3 * ((i+2) * 999)
                  a5 = a k k
              in a a4 a5 * k
        s = sum (map f [0..9])
    in out 0 (mce2 s s)

-- | <http://fredrikolofsson.com/f0blog/?q=node/478> (f0)
f0_tw0020 :: UGen
f0_tw0020 =
    let a n = lfPulse AR n 0 0.5
        b = mce [1..4]
        a1 = (a (b/32) + 1) / 8
        a2 = (a a1 + 1) * b
        a3 = a (b/64)
        a4 = a (a (b/8)) * 2 + b
        a5 = a (4/b)
        a6 = a a2
        a7 = a ((a6 + ((mix a3 + a5) * a4)) * 100)
        s = mix a7 / 8
    in out 0 (mce2 s s)

fib :: Integral i => [i]
fib = 0 : scanl (+) 1 fib

{-
sc3_fib 16 == [1,1,2,3,5,8,13,21,34,55,89,144,233,377,610,987]
-}
sc3_fib :: Integral a => Int -> [a]
sc3_fib n = take n (tail fib)

-- | <http://www.fredrikolofsson.com/f0blog/?q=node/537> (f0)
f0_tw0028 :: UGen
f0_tw0028 =
    let n = map ((* 99) . (`mod` 8)) (sc3_fib 16)
        p = dseq 'α' dinf (dshuf 'β' 8 (mce (map fromInteger n)))
        q = combN (duty AR (1/8) 0 DoNothing p) 4 4 16
        o = lfTri AR q 0 / 4
        f = lfTri KR (1/16) 0 * 2e3 + 3e3
    in out 0 (pan2 (moogFF o f 2 0) 0 1)

-- | <www.fredrikolofsson.com/f0blog/?q=node/537> (f0)
f0_tw0030 :: UGen
f0_tw0030 =
    let a i j k l = lfPar AR i j * k + l
        f = a 1 0 5 (a (mce2 0.05 0.04) 0 50 160 `roundTo` 50)
        w = a 0.2 0 0.5 (a 3 0 0.2 0.5)
        o = varSaw AR f 0 w / 8
    in out 0 (gVerb o 80 3 0.5 0.5 15 1 0.7 0.5 300 * 0.1)

-- | <http://www.fredrikolofsson.com/f0blog/?q=node/537> (f0)
f0_tw0033 :: UGen
f0_tw0033 =
    let f = roundE (lfPar AR (1/14) 0) * 20 + 80
        a = pulse AR (mce [1..4]) 0.35
        n = mce (map (flip brownNoise AR) ['α','β','γ','δ']) * a
        z i = mce2 ((i + 1) * f) ((i * f) + (i + 1 / 3))
        o = lfPar AR (mce (map z [0..3])) 0
        (s1,_s2) = unmce2 (splay ((o `greater_than` n) / 3) 1 1 0 True)
    in s1 * 0.1 -- (s1 + s2) CRASHES SCSYNTH?

-- | <http://www.fredrikolofsson.com/f0blog/?q=node/537> (f0)
f0_tw0041 :: UGen
f0_tw0041 =
    let s = sweep (localIn' 6 AR) 1
        i = impulse AR (mce [1,0.749,6,12,3,4]) 0
        o = sinOsc AR (1 / runningMax s i) 0
    in mrg [tanh (splay o 1 1 0 True) / 2 * 0.1
           ,localOut o]

-- | <www.fredrikolofsson.com/f0blog/?q=node/537> (f0)
f0_tw0045 :: UGen
f0_tw0045 =
    let a i j k l = sinOsc AR i j * k + l
        f = a (a 0.11 0 1 0) 0 1 0
        p_f = a (95 * a 0.01 0 1 1) 0 (a 5e-3 0 50 0) 100
        p = a p_f (a (mce2 98 97) 0 1 0) (pi + a 5e-4 0 1 0) 0
    in tanh (a f p 1 0) * 0.1

-- | <https://www.listarc.bham.ac.uk/lists/sc-users/msg18379.html> (f0)
f0_tw0049 :: UGen
f0_tw0049 =
    let t = t2a 0 0
        o0 = lfSaw AR 3 0 * 9 + 99
        s0 = sweep t (mce [3..9]) `modE` o0
        s1 = sweep t (mce [33,32..3]) `modE` 128 .&. s0
        o1 = sinOsc AR (midiCPS (s1+33)) 0 * pi
    in out 0 (splay (sinOsc AR 9 o1) 1 1 0 True / 3)

{-
> ascii_u "sunday" == mce (map constant [115,117,110,100,97,121])
-}
ascii_u :: String -> UGen
ascii_u = mce . map (constant.fromEnum)

-- | <http://sccode.org/1-4Qy> (f0)
f0_tw0051 :: UGen
f0_tw0051 =
    let i = a (ascii_u "sunday")
        f = a (9 / ascii_u "slow") * 400 + 500
        w = a (7 / ascii_u "coding") + 1.1
        a = saw AR
        l = splay (bBandPass i f w / 5) 1 1 0 True
    in gVerb l 10 3 0.5 0.5 15 1 0.7 0.5 300

-- | <http://sccode.org/1-4Qy> (f0)
f0_tw0077 :: UGen
f0_tw0077 =
    let a = sinOsc AR
        f = a (1 / mce2 5 6) 0 + mce2 798 912
        p = (a (1 / 16) 0 * 19 + 99) * a (mce2 9 8) 0
        m = a (a 6 0 * a 0.009 0) 0
        b = a f p * m
    in tanh (a (mce2 201 301) b)

-- | <http://sccode.org/1-4Qy> (f0)
f0_tw0084 :: UGen
f0_tw0084 =
    let a = saw AR
        f = a (mce [5,7..15] * 19) * 99 + 199
        g = a (mce [1,3..13] * 29) * 199 + 299
        w = a (mce [3,5..11] * (a 3 * 2 + 3)) * 299 + 399
    in splay (formant AR f g w) 1 1 0 True / 3

-- | <http://sccode.org/1-4Qy> (f0)
f0_tw0120 :: UGen
f0_tw0120 =
    let a = lfTri
        z = a KR (1 / mce2 7 8) 0 * a KR (1 / 9) 0 * 99
        l = midiCPS (mce [60 .. 79])
        f = select z l
        w = a KR (1 / mce2 3 4) 0 `modE` 1
        o = varSaw AR f 0 w
    in combN o 1 (1 / mce2 5 6) 8 / 4

-- | <http://sccode.org/1-4Qy> (f0)
f0_tw0121 :: UGen
f0_tw0121 =
    let a = sinOsc
        z = a KR (1 / mce2 8 7) 0 * a KR (1 / 30) 0 * 9
        l = midiCPS (mce [56,62 .. 98])
        m = a AR (1 / mce2 4 3) 0
        o = a AR (select z l) 0 * m
    in tanh (combN o 1 (1 / mce2 6 5) 9)

-- | <http://sccode.org/1-4Qy> (f0)
f0_tw0125 :: UGen
f0_tw0125 =
    let a = sinOsc AR
        f = a (1 / mce [8,9]) 0 * 4 + mce [400,202]
        u = (a (1/9) 0 + 1) / 88
        d = (a (1/8) 0 + 1) / 99
        i = inFeedback 1 (mce [1,0])
        p = combC (lagUD i u d) 1 0.08 9
    in a f p

mean :: Fractional a => [a] -> a
mean l = sum l / fromIntegral (length l)

-- | <http://sccode.org/1-4Qy> (f0) (requires -w 512)
f0_tw0134 :: UGen
f0_tw0134 =
    let a = lfSaw AR
        n' = 50
        n = constant n'
        z i = let o1 = a ((i + 1) / mce [3,4]) 0
                  o2 = a ((i + 1) / 8) 0 + 1
                  f0 = o1 `greater_than` o2 * (n / 2) + n
                  m = a ((i + 1) / n) (i / (n / 2))
                  o3 = blip AR f0 (i + mce [2,3]) * m
              in ringz o3 ((i + 1) * (n * 2 - 1)) 0.1
    in mean (map z [0 .. n'])  / 5

-- | <http://www.fredrikolofsson.com/f0blog/?q=node/617> (f0)
f0_tw0220 :: UGen
f0_tw0220 =
    let c = inFeedback 1 0
        b = clearBuf (localBuf 'α' 1 90000)
        g = tGrains 2 (sinOsc AR 3 0) b (c + 3) 2 12 0 0.1 4
        r = recordBuf AR b 0 1 0 1 Loop 1 DoNothing c
    in mrg2 (hpf (sinOsc AR 99 (c * 6) / 9 + g) 9) r

-- | <http://www.fredrikolofsson.com/f0blog/?q=node/617> (f0)
f0_tw0224 :: UGen
f0_tw0224 =
    let c = 200000
        b = clearBuf (localBuf 'α' 2 c)
        d = bufRd 2 AR b (sinOsc AR (mce2 2 3 * 9) 0 * c) NoLoop LinearInterpolation
        w = bufWr b (abs (sinOsc AR (mce2 99 145) 0) * c) Loop (sinOsc AR (3 / mce2 2 3) 0 / 3)
    in mrg2 d w

-- | <http://www.fredrikolofsson.com/f0blog/?q=node/617> (f0)
f0_tw0225 :: UGen
f0_tw0225 =
    let b = mce [1..8] * 99
        o = blip AR (b / 2 + lfSaw KR ((-8) / b) 1 * 99) (b / 4 + (lfSaw KR (1 / b) 1 * 99))
    in sin (splay (combN (o * sinOsc AR (8 / b) (lfSaw AR (99 / b) 0)) 0.2 0.2 1) 1 1 0 True)

-- * PACT

-- | <http://www.fredrikolofsson.com/f0blog/?q=node/490> (f0)
pkt_00 :: UGen
pkt_00 =
    let sosc fr = sinOsc AR fr 0
        f0 = mce3 100 200 300 + sosc (mce3 0.11 0.22 0.33)
        ph0 = sosc (mce3 0.1 0.2 0.3) * 2 * pi
        a0 = 0.1 + sosc (mce3 0.01 0.02 0.03) * 0.05
        i = sinOsc AR f0 ph0 * a0
        w = sosc (sosc (sosc 0.13 * 5 + 6) * 8 + 50)
        s = splay i w 0.7 (sosc 1.2 * 0.6) True
    in out 0 (gVerb s 20 5 1 0.5 25 0 1 1 30)

-- | <http://www.fredrikolofsson.com/f0blog/?q=node/490> (f0)
pkt_26_grid :: UGen -> UGen -> UGen
pkt_26_grid n i =
    let t = i / n
        a = abs (varSaw AR 0.02 t 0.5 * 7.5)
        b = varSaw AR 0.16 t (2/3) * a + 300
        c = varSaw AR 0.064 t 0.5 * 25 + 50
        d = varSaw AR 0.012 t 0.75 * c + 200
        e = varSaw AR 0.024 t 0.25 * 0.475 + 0.5
        f = varSaw AR (100 + i) t e
        g = varSaw AR 0.048 0 0.5 * 25 + 150
        h = varSaw AR ((i + 1) * g) t (1/3) * 150
        o = sinOsc AR h (f * pi) * d + b
        z = leakDC (varSaw AR o t 0.5) 0.995
    in pan2 z (varSaw AR 0.02 t 0.5) (1 / n)

pkt_26 :: UGen
pkt_26 = mixFill 8 (pkt_26_grid 8)

-- | <http://www.fredrikolofsson.com/f0blog/?q=node/490> (f0)
pkt_28_rnd :: UGen -> UGen -> UGen
pkt_28_rnd n i =
    let a = lfSaw AR ((i + 1) * 5) 0 * 0.5 * pi
        b = sinOsc AR ((i + 1) * 0.001) 0 * 0.5
        c = max (lfSaw AR (0.2 + b) (i / n) * 0.4) 0
        d = sinOsc AR 0.03 (i + 1) * 0.5 + 1
        e = sinOsc AR (200 + i) 0 * d
        f = sinOsc AR 0.04 (i + 2) * 0.5 + 1
        g = sinOsc AR (400 + i) 0 * f
        h = sinOsc AR 0.05 (i + 3) * 0.5 + 1
        j = sinOsc AR (800 + i) 0 * h
        k = linExp i 0 (n - 1) 70 1500
        z = sinOsc AR k a * c * e * g * j
        l = linLin i 0 (n - 1) (-0.925) 0.925
    in pan2 z l (1 / n)

pkt_28 :: UGen
pkt_28 =
    let y = limiter (leakDC (mixFill 28 (pkt_28_rnd 28)) 0.995) 1 0.01
    in gVerb y 3 5 0.2 0.8 20 0.1 0.7 0.5 300

-- * http://www.fredrikolofsson.com/f0blog/?q=node/490 (f0)

type T4 a = (a,a,a,a)

pkt_07_param :: Fractional n => Int -> [T4 n]
pkt_07_param n =
    let f g z = take n (iterate g z)
    in zip4 (f (* 4) 2) (f (/ 2) (1/2)) (f (* 4) 1) (f (* 4) 2)

pkt_07_gen :: UGen -> T4 UGen -> UGen
pkt_07_gen f0 (m,f1,l,r) = sinOsc AR f0 0 * m + linExp (sinOsc AR f1 0) (-1) 1 l r

pkt_07 :: Int -> UGen
pkt_07 n =
    let c = foldl pkt_07_gen 1 (pkt_07_param n)
        o = sinOsc AR c 0 * 0.1
    in gVerb (leakDC o 0.995) 16 8 0.75 0.5 15 1 0.7 0.5 16

{-

> pkt_07_param 6
> let p6 = pkt_07 6
> let p12 = pkt_07 12

-}

-- | <https://www.listarc.bham.ac.uk/lists/sc-users/msg17536.html> (f0)
f0_17536 :: UGen
f0_17536 =
    let s0 = lfSaw AR 10 0 * 0.01
        t0 = lfTri AR (mce2 5 6 * 0.1) 0
        t1 = lfTri KR 0.1 0 * 0.05 + 0.05
        s1 = limiter (brf s0 t0 1) 1 0.01
        o = combN s1 0.1 (roundTo t1 0.01) 1
    in o * 0.1
