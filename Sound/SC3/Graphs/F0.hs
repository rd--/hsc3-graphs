module Sound.SC3.Graphs.F0 where

import Data.Bits {- base -}
import Data.List {- base -}

import Sound.OSC {- hosc -}
import Sound.SC3 {- hsc3 -}

import qualified Sound.SC3.Lang.Pattern.Plain as P {- hsc3-lang -}

-- * 454598285861617665

f0_454598285861617665 :: UGen
f0_454598285861617665 =
    let b = mce [9,8 .. 1]
        c = lfTri AR (3 ** lfTri AR (1 / b) (b / 9)) 0
        d = lfTri AR (1 / b) 0 `modE` 1 / 9 + 0.01
        f = 2 ** roundE (lfTri AR (b / 99) 0) * 99 * b
        o = grainSin 2 c d f 0 (-1) 512
    in splay (tanh o) 1 1 0 True / 2

-- * 456384156159574016

f0_456384156159574016 :: UGen
f0_456384156159574016 =
    let a = 1 / mce [3,12,4,1,6,2]
        s = lag3 (sinOsc AR a 0) (abs (sinOsc AR (2.67 ** a) 0)) * 99
        f = ((sinOsc AR ((1 / a) / 9) a >* 0) * 20 + 99) / a
    in splay (sinOsc AR (hpf (ringz s f 1) 440) 0) 1 1 0 True * 0.25

-- * chipwave

control_n :: Rate -> String -> [Double] -> UGen
control_n rt nm =
    let f n = control rt (if n == 0 then nm else nm ++ show n)
    in mce . zipWith f [0::Int ..]

cw_ioscs :: [Double] -> [Double] -> UGen
cw_ioscs ws_def ps_def =
    let k = control KR
        k_n = control_n KR
        bus = k "out" 0
        amp = k "amp" 0.5
        freq = k "freq" 400
        width = k "width" 0.25
        gt = k "gate" 1
        atk = k "atk" 0.002
        dec = k "dec" 0
        sus = k "sus" 1
        rel = k "rel" 0.2
        ws = k_n "ws" ws_def
        ps = k_n "ps" ps_def
        e = envGen AR gt amp 0 1 RemoveSynth (envADSR' atk dec sus rel)
        w = duty AR 0.025 0 DoNothing (dseq 'α' 1 ws)
        p = duty AR 0.025 0 DoNothing (dseq 'β' 1 ps)
        freq' = freq * midiRatio p
        ti = lfTri AR freq' 0 * 0.5 + 0.5
        sq = lfPulse AR freq' 0 (width * 0.5) * 2 - 1
        ns = lfNoise0 'γ' AR (freq' * 10)
        z = select w (mce [dc AR 0, ti, sq, ns])
    in out bus (leakDC (z * e) 0.995)

cw_ioscs_arp :: Synthdef
cw_ioscs_arp = synthdef "ioscs-arp" (cw_ioscs [0,2,2,3,2,2,2,2,2] [0,12,-12,0,7,0,7,0,7])

cw_ioscs_bass :: Synthdef
cw_ioscs_bass = synthdef "ioscs-bass" (cw_ioscs [0,1,1,1,1,1,1,1,1] [0,24,0,12,0,-1,1,-1,0])

chipwave :: NRT
chipwave =
    let a = (cw_ioscs_arp
            ,[("freq",cycle (map midiCPS [60,60,70,60,65,63]))
             ,("amp",repeat 0.15)
             ,("dur",repeat 0.25)
             ,("width",cycle [0,0.05 .. 1])])
        b = (cw_ioscs_bass
            ,[("freq",cycle (map midiCPS [40,48,48,60]))
             ,("amp",repeat 0.5)
             ,("rel",repeat 0.3)
             ,("dur",repeat 0.5)
             ,("width",repeat 0.5)
             ,("out",repeat 1)])
    in nrt_merge (P.sbind1 b) (P.sbind1 a)

-- * feedback

feedback4 :: UGen
feedback4 =
    let k = control KR
        freq = k "freq" 400
        amp = k "amp" 0.1
        fb = k "fb" 2
        del = k "del" 0.1
        lfo = k "lfo" 1
        rate = k "rate" 2
        cutoff = k "cutoff" 500
        env = envGen KR 1 1 0 1 RemoveSynth (envPerc 1  4)
        lin = delayN (hpf (localIn 1 AR 0) cutoff) 1 del
        src = sinOsc AR (freq + sinOsc AR rate 0 * lfo) (lin * 2 * pi * fb) * amp * env
    in mrg2 (out 0 (pan2 src 0 1)) (localOut src)

type Param = [(String, Double)]

f0_fb_param :: [Param]
f0_fb_param =
    [[]
    ,[("del",0.5)]
    ,[("del",0.1),("cutoff",100)]
    ,[("del",0.1),("fb",3),("cutoff",100)]
    ,[("del",0.1),("fb",2),("lfo",15),("cutoff",100)]
    ,[("del",0.2),("fb",3),("lfo",100),("freq",100),("cutoff",100)]
    ,[("del",0.5),("fb",1),("lfo",200),("freq",300),("rate",0.01),("cutoff",100)]]

f0_fb_au :: Param -> IO ()
f0_fb_au p = audition_at (-1,AddToHead,1,p) feedback4 >> pauseThread (2::Double)

-- * http://fredrikolofsson.com/f0blog/?q=node/478 (f0)

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

-- * http://fredrikolofsson.com/f0blog/?q=node/478 (f0)

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

-- * http://www.fredrikolofsson.com/f0blog/?q=node/537 (f0)

fib :: Integral i => [i]
fib = 0 : scanl (+) 1 fib

{-
sc3_fib 16 == [1,1,2,3,5,8,13,21,34,55,89,144,233,377,610,987]
-}
sc3_fib :: Integral a => Int -> [a]
sc3_fib n = take n (tail fib)

f0_0028 :: UGen
f0_0028 =
    let n = map ((* 99) . (`mod` 8)) (sc3_fib 16)
        p = dseq 'α' dinf (dshuf 'β' 8 (mce (map fromInteger n)))
        q = combN (duty AR (1/8) 0 DoNothing p) 4 4 16
        o = lfTri AR q 0 / 4
        f = lfTri KR (1/16) 0 * 2e3 + 3e3
    in out 0 (pan2 (moogFF o f 2 0) 0 1)

-- * www.fredrikolofsson.com/f0blog/?q=node/537 (f0)

f0_0030 :: UGen
f0_0030 =
    let a i j k l = lfPar AR i j * k + l
        f = a 1 0 5 (a (mce2 0.05 0.04) 0 50 160 `roundTo` 50)
        w = a 0.2 0 0.5 (a 3 0 0.2 0.5)
        o = varSaw AR f 0 w / 8
    in out 0 (gVerb o 80 3 0.5 0.5 15 1 0.7 0.5 300 * 0.1)

-- * http://www.fredrikolofsson.com/f0blog/?q=node/537 (f0)

f0_0033 :: UGen
f0_0033 =
    let f = roundE (lfPar AR (1/14) 0) * 20 + 80
        a = pulse AR (mce [1..4]) 0.35
        n = uclone 'α' 4 (brownNoise 'α' AR) * a
        z i = mce2 (i + 1 * f) (i * f + (i + 1 / 3))
        o = lfPar AR (mce (map z [0..3])) 0
    in out 0 (splay ((o >* n) / 3) 1 1 0 True * 0.1)

-- * http://www.fredrikolofsson.com/f0blog/?q=node/537 (f0)

f0_tw0041 :: UGen
f0_tw0041 =
    let s = sweep (localIn' 6 AR) 1
        i = impulse AR (mce [1,0.749,6,12,3,4]) 0
        o = sinOsc AR (1 / runningMax s i) 0
    in mrg [tanh (splay o 1 1 0 True) / 2 * 0.1
           ,localOut o]

-- * www.fredrikolofsson.com/f0blog/?q=node/537 (f0)

f0_0045 :: UGen
f0_0045 =
    let a i j k l = sinOsc AR i j * k + l
        f = a (a 0.11 0 1 0) 0 1 0
        p_f = a (95 * a 0.01 0 1 1) 0 (a 5e-3 0 50 0) 100
        p = a p_f (a (mce2 98 97) 0 1 0) (pi + a 5e-4 0 1 0) 0
    in tanh (a f p 1 0) * 0.1

-- * https://www.listarc.bham.ac.uk/lists/sc-users/msg18379.html (f0)

f0_0049 :: UGen
f0_0049 =
    let t = t2A 0 0
        o0 = lfSaw AR 3 0 * 9 + 99
        s0 = sweep t (mce [3..9]) `modE` o0
        s1 = sweep t (mce [33,32..3]) `modE` 128 .&. s0
        o1 = sinOsc AR (midiCPS (s1+33)) 0 * pi
    in out 0 (splay (sinOsc AR 9 o1) 1 1 0 True / 3)

-- * http://sccode.org/1-4Qy (f0)

{-
> ascii_u "sunday" == mce (map constant [115,117,110,100,97,121])
-}
ascii_u :: String -> UGen
ascii_u = mce . map (constant.fromEnum)

f0_tw0051 :: UGen
f0_tw0051 =
    let i = a (ascii_u "sunday")
        f = a (9 / ascii_u "slow") * 400 + 500
        w = a (7 / ascii_u "coding") + 1.1
        a = saw AR
        l = splay (bBandPass i f w / 5) 1 1 0 True
    in gVerb l 10 3 0.5 0.5 15 1 0.7 0.5 300

-- * http://sccode.org/1-4Qy (f0)

f0_tw0077 :: UGen
f0_tw0077 =
    let a = sinOsc AR
        f = a (1 / mce2 5 6) 0 + mce2 798 912
        p = (a (1 / 16) 0 * 19 + 99) * a (mce2 9 8) 0
        m = a (a 6 0 * a 0.009 0) 0
        b = a f p * m
    in tanh (a (mce2 201 301) b)

-- * http://sccode.org/1-4Qy (f0)

f0_tw0084 :: UGen
f0_tw0084 =
    let a = saw AR
        f = a (mce [5,7..15] * 19) * 99 + 199
        g = a (mce [1,3..13] * 29) * 199 + 299
        w = a (mce [3,5..11] * (a 3 * 2 + 3)) * 299 + 399
    in splay (formant AR f g w) 1 1 0 True / 3

-- * http://sccode.org/1-4Qy (f0)

f0_tw0120 :: UGen
f0_tw0120 =
    let a = lfTri
        z = a KR (1 / mce2 7 8) 0 * a KR (1 / 9) 0 * 99
        l = midiCPS (mce [60 .. 79])
        f = select z l
        w = a KR (1 / mce2 3 4) 0 `modE` 1
        o = varSaw AR f 0 w
    in combN o 1 (1 / mce2 5 6) 8 / 4

-- * http://sccode.org/1-4Qy (f0)

f0_tw0121 :: UGen
f0_tw0121 =
    let a = sinOsc
        z = a KR (1 / mce2 8 7) 0 * a KR (1 / 30) 0 * 9
        l = midiCPS (mce [56,62 .. 98])
        m = a AR (1 / mce2 4 3) 0
        o = a AR (select z l) 0 * m
    in tanh (combN o 1 (1 / mce2 6 5) 9)

-- * http://sccode.org/1-4Qy (f0)

f0_tw0125 :: UGen
f0_tw0125 =
    let a = sinOsc AR
        f = a (1 / mce [8,9]) 0 * 4 + mce [400,202]
        u = (a (1/9) 0 + 1) / 88
        d = (a (1/8) 0 + 1) / 99
        i = inFeedback 1 (mce [1,0])
        p = combC (lagUD i u d) 1 0.08 9
    in a f p

-- * http://sccode.org/1-4Qy (f0)

mean :: Fractional a => [a] -> a
mean l = sum l / fromIntegral (length l)

{- scsynth -u 57110 -w 512 -}
f0_tw0134 :: UGen
f0_tw0134 =
    let a = lfSaw AR
        n' = 50
        n = constant n'
        z i = let o1 = a ((i + 1) / mce [3,4]) 0
                  o2 = a ((i + 1) / 8) 0 + 1
                  f0 = o1 >* o2 * (n / 2) + n
                  m = a ((i + 1) / n) (i / (n / 2))
                  o3 = blip AR f0 (i + mce [2,3]) * m
              in ringz o3 ((i + 1) * (n * 2 - 1)) 0.1
    in mean (map z [0 .. n'])  / 5

-- * http://www.fredrikolofsson.com/f0blog/?q=node/617 (f0)

f0_tw0220 :: UGen
f0_tw0220 =
    let c = inFeedback 1 0
        b = clearBuf (localBuf 'α' 1 90000)
        g = tGrains 2 (sinOsc AR 3 0) b (c + 3) 2 12 0 0.1 4
        r = recordBuf AR b 0 1 0 1 Loop 1 DoNothing c
    in mrg2 (hpf (sinOsc AR 99 (c * 6) / 9 + g) 9) r

{-
2014-10-11: tgrains needs a patch to work with localbuf
http://article.gmane.org/gmane.comp.audio.supercollider.user/110110
main = withSC3 (async (b_alloc bufnum 90000 1) >> play (out 0 f0_tw0220))
-}

-- * http://www.fredrikolofsson.com/f0blog/?q=node/617 (f0)

f0_tw0224 :: UGen
f0_tw0224 =
    let c = 200000
        b = clearBuf (localBuf 'α' 2 c)
        d = bufRd 2 AR b (sinOsc AR (mce2 2 3 * 9) 0 * c) NoLoop LinearInterpolation
        w = bufWr b (abs (sinOsc AR (mce2 99 145) 0) * c) Loop (sinOsc AR (3 / mce2 2 3) 0 / 3)
    in mrg2 d w

-- * http://www.fredrikolofsson.com/f0blog/?q=node/617 (f0)

f0_tw0225 :: UGen
f0_tw0225 =
    let b = mce [1..8] * 99
        o = blip AR (b / 2 + lfSaw KR ((-8) / b) 1 * 99) (b / 4 + (lfSaw KR (1 / b) 1 * 99))
    in sin (splay (combN (o * sinOsc AR (8 / b) (lfSaw AR (99 / b) 0)) 0.2 0.2 1) 1 1 0 True)

-- * http://www.fredrikolofsson.com/f0blog/?q=node/490 (f0)

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

-- * http://www.fredrikolofsson.com/f0blog/?q=node/490 (f0)

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

-- * http://www.fredrikolofsson.com/f0blog/?q=node/490 (f0)

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

-- * http://sccode.org/1-4Q6 (f0)

{-

> audition risset_u

> let set p = withSC3 (send (n_set (-1) p))
> set [("trig",1)]
> set [("freq",midiCPS 100),("sustain",3),("trig",1)]
> set [("freq",midiCPS 60),("sustain",9),("trig",1)]
> set [("freq",midiCPS 40),("sustain",15),("trig",1)]

> audition (P.nbind1 risset_p)

-}

risset_u :: UGen
risset_u =
    let k = control KR
        pan = k "pan" 0
        f = k "freq" 400
        ampl = k "amp" 0.1
        d = k "sustain" 2
        tr = tr_control "trig" 1
        amps = [1,0.67,1,1.8,2.67,1.67,1.46,1.33,1.33,1,1.33]
        durs = [1,0.9,0.65,0.55,0.325,0.35,0.25,0.2,0.15,0.1,0.075]
        frqs = [0.56,0.56,0.92,0.92,1.19,1.7,2,2.74,3,3.76,4.07]
        dets = [0,1,0,1.7,0,0,0,0,0,0,0]
        fn i =
            let shp = let c = EnvNum (-4.5)
                      in envPerc' 0.005 (d * durs!!i) (amps!!i) (c,c)
                env = envGen AR tr 1 0 1 DoNothing shp
            in sinOsc AR (f * frqs!!i + dets!!i) 0 * ampl * env
        src = mixFill 11 fn
    in pan2 src pan 1

risset_s :: Synthdef
risset_s = synthdef "risset" (out 0 risset_u)

risset_p :: (Synthdef,Int,P.Param)
risset_p =
    let fr = let d = P.rand 'α' [0,2,5,7,11]
                 o = P.rand 'β' [4,5,6,7,9]
                 sc = [0,2,4,5,7,9,11]
             in P.degree_to_cps' sc 12 d o
        du = P.rand 'γ' [2,3,5,7]
    in (risset_s,1000
       ,[("freq",fr)
        ,("dur",du)
        ,("sustain",map (* 1.25) du)
        ,("amp",P.white 'δ' 0.025 0.15)
        ,("trig",repeat 1)])

-- * https://www.listarc.bham.ac.uk/lists/sc-users/msg17536.html (f0)

f0_17536 :: UGen
f0_17536 =
    let s0 = lfSaw AR 10 0 * 0.01
        t0 = lfTri AR (mce2 5 6 * 0.1) 0
        t1 = lfTri KR 0.1 0 * 0.05 + 0.05
        s1 = limiter (brf s0 t0 1) 1 0.01
        o = combN s1 0.1 (roundTo t1 0.01) 1
    in o * 0.1

-- * red_frik (f0)

red :: UId m => UGen -> UGen -> m UGen
red tr n = do
  r1 <- tRandM 0.3 3 tr
  r2 <- tRandM 0.3 5 tr
  r3 <- tRandM 0 0.5 tr
  r4 <- tRandM 0.49 0.56 tr
  r5 <- tRandM 0.3 0.6 tr
  r6 <- tRandM 0.3 0.5 tr
  let o1 = fSinOsc KR r2 0 * r3 + r4
      o2 = fSinOsc KR o1 0 * r5 + r6
  return (rhpf n r1 o2)

red_frik_m :: UId m => m UGen
red_frik_m = do
  n <- clone 2 (brownNoiseM AR)
  let tr = impulse KR 0.1 0
  red tr n

red_frik :: UGen
red_frik = uid_st_eval red_frik_m
