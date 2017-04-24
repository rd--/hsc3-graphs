module Sound.SC3.Graphs.F0 where

import Data.List {- base -}

import Sound.OSC {- hosc -}
import Sound.SC3 {- hsc3 -}

import qualified Sound.SC3.Lang.Pattern.Plain as P {- hsc3-lang -}

-- 454598285861617665

f0_454598285861617665 :: UGen
f0_454598285861617665 =
    let b = mce [9,8 .. 1]
        c = lfTri AR (3 ** lfTri AR (1 / b) (b / 9)) 0
        d = lfTri AR (1 / b) 0 `modE` 1 / 9 + 0.01
        f = 2 ** roundE (lfTri AR (b / 99) 0) * 99 * b
        o = grainSin 2 c d f 0 (-1) 512
    in splay (tanh o) 1 1 0 True / 2

-- 456384156159574016

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

-- feedback

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

-- http://fredrikolofsson.com/f0blog/?q=node/478 (f0)

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

-- http://fredrikolofsson.com/f0blog/?q=node/478 (f0)

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

-- http://www.fredrikolofsson.com/f0blog/?q=node/490 (f0)

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

-- http://www.fredrikolofsson.com/f0blog/?q=node/490 (f0)

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

-- http://www.fredrikolofsson.com/f0blog/?q=node/490 (f0)

type T4 a = (a,a,a,a)

-- > pkt_07_param 6
pkt_07_param :: Fractional n => Int -> [T4 n]
pkt_07_param n =
    let f g z = take n (iterate g z)
    in zip4 (f (* 4) 2) (f (/ 2) (1/2)) (f (* 4) 1) (f (* 4) 2)

pkt_07_gen :: UGen -> T4 UGen -> UGen
pkt_07_gen f0 (m,f1,l,r) = sinOsc AR f0 0 * m + linExp (sinOsc AR f1 0) (-1) 1 l r

-- > let p6 = pkt_07 6
-- > let p12 = pkt_07 12
pkt_07 :: Int -> UGen
pkt_07 n =
    let c = foldl pkt_07_gen 1 (pkt_07_param n)
        o = sinOsc AR c 0 * 0.1
    in gVerb (leakDC o 0.995) 16 8 0.75 0.5 15 1 0.7 0.5 16
