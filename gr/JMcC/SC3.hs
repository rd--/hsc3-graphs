module JMcC.SC3 where

import Control.Applicative {- base -}
import Control.Concurrent {- base -}
import Control.Monad {- base -}
import Data.List {- base -}

import qualified System.Random as R {- random -}

import qualified Control.Monad.Random as MR {- MonadRandom -}

import Sound.OSC {- hosc -}
import Sound.SC3 as SC3 {- hsc3 -}
import Sound.SC3.Common.Monad.Operators ((+.),(.+.)) {- hsc3 -}

import qualified Sound.SC3.UGen.Protect as Protect {- hsc3-rw -}

import qualified Sound.SC3.Lang.Collection as C {- hsc3-lang -}
import qualified Sound.SC3.Lang.Control.OverlapTexture as O {- hsc3-lang -}
import qualified Sound.SC3.Lang.Pattern.Bind as P {- hsc3-lang -}
import qualified Sound.SC3.Lang.Random.Gen as R.Gen {- hsc3-lang -}
import qualified Sound.SC3.Lang.Random.ID as R {- hsc3-lang -}
import qualified Sound.SC3.Lang.Random.Monad as MR {- hsc3-lang -}

import qualified Sound.SC3.UGen.Bindings.DB.RDU as RDU {- sc3-rdu -}

-- * UTIL

-- | 'demand' of 'dseq', somewhat akin to SC2 Sequencer.
dsequ :: ID z => z -> [UGen] -> UGen -> UGen
dsequ z s tr = demand tr 0 (dseq z dinf (mce s))

-- | 'demand' of 'dshuf' with 'dinf' repeat, ie. randomised 'dsequ'.
dsequR :: ID z => z -> [UGen] -> UGen -> UGen
dsequR z s tr = demand tr 0 (dshuf z dinf (mce s))

-- | 'demand' of 'dxrand' with 'dinf' repeat, ie. alternate randomised 'dsequ'.
dsequX :: ID z => z -> [UGen] -> UGen -> UGen
dsequX z s tr = demand tr 0 (dxrand z dinf (mce s))

-- | 'dsequ' '*' /tr/, ie. impulse sequencer.
isequ :: ID z => z -> [UGen] -> UGen -> UGen
isequ z s tr = dsequ z s tr * tr

isequX :: ID z => z -> [UGen] -> UGen -> UGen
isequX z s tr = dsequX z s tr * tr

enumFromN :: Enum a => a -> Int -> [Int]
enumFromN e i = let j = fromEnum e in [j .. j + i]

nrec :: (Num a, Ord a) => a -> (t -> t) -> t -> t
nrec n f st = if n > 0 then nrec (n - 1) f (f st) else st

-- * zizle (jmcc) #SC3d1.5

zizle :: UGen
zizle =
  let a e f = let fm = mce2 (rand 'α' 0.7 1.3) 1
                  ph = mce2 (rand 'β' 0 two_pi) (rand 'γ' 0 two_pi)
              in Protect.uprotect_all e (mix (sinOsc AR (f * fm) ph * 0.1))
      a1 = max (a 'δ' (expRand 'ε' 0.3 8)) 0
      a2 = abs (a 'ζ' (expRand 'η' 6 24))
      o = sinOsc AR (midiCPS (rand 'θ' 24 108)) (rand 'ι' 0 two_pi)
  in pan2 (o * a1 * a2) (rand2 'κ' 1) 1

zizle_ot :: IO ()
zizle_ot = O.overlapTextureU (4,4,12,maxBound) zizle

-- * babbling brook (jmcc) #SC3

{- | http://lists.create.ucsb.edu/pipermail/sc-users/2007-April/033239.html -}
babbling_brook :: UGen
babbling_brook =
  let b f m a g = let n3 = lpf (brownNoise 'α' AR) f * m + a
                      n4 = onePole (brownNoise 'β' AR) 0.99
                  in rhpf n4 n3 0.03 * g
      x = Protect.uclone_all 'γ' 2 (b 14 400 500 0.006)
      y = Protect.uclone_all 'δ' 2 (b 20 800 1000 0.010)
  in x + y

babbling_brook_m :: UId m => m UGen
babbling_brook_m = do
  let b f m a g = do n1 <- brownNoiseM AR
                     n2 <- brownNoiseM AR
                     let n3 = lpf n2 f * m + a
                         n4 = onePole n1 0.99
                     return (rhpf n4 n3 0.03 * g)
  x <- clone 2 (b 14 400 500 0.006)
  y <- clone 2 (b 20 800 1000 0.010)
  return (x + y)

-- * mridangam (jmcc) #SPE3

mri_mridangam :: UGen
mri_mridangam =
    let a = tr_control "amp" 1
        n = whiteNoise 'α' AR * 70
        e = decay2 a 0.002 0.1
    in distort (resonz (n * e) (midiCPS 60) 0.02 * 4) * 0.4

mri_drone :: UGen
mri_drone =
    let s1 = saw AR (midiCPS (mce2 60 60.04))
        s2 = saw AR (midiCPS (mce2 67 67.04))
    in lpf (s1 + s2) (midiCPS 108) * 0.007

lseq :: [a] -> Int -> [a]
lseq l n = concat (replicate n l)

lrand :: Enum e => e -> [[a]] -> Int -> [a]
lrand e l n = concat (R.nchoose e n l)

mri_a_seq :: (Num i,Fractional n) => ([n] -> i -> t) -> ([[n]] -> i -> t) -> [t]
mri_a_seq sq_f rnd_f =
    [sq_f [0.0] 10
    {- intro -}
    ,sq_f [0.9,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0] 2
    ,sq_f [0.9,0.0,0.0,0.2,0.0,0.0,0.0,0.2,0.0,0.0] 2
    ,sq_f [0.9,0.0,0.0,0.2,0.0,0.2,0.0,0.2,0.0,0.0] 2
    ,sq_f [0.9,0.0,0.0,0.2,0.0,0.0,0.0,0.2,0.0,0.2] 2
    {- solo -}
    ,rnd_f [[0.9,0.0,0.0,0.7,0.0,0.2,0.0,0.7,0.0,0.0]
           ,[0.9,0.2,0.0,0.7,0.0,0.2,0.0,0.7,0.0,0.0]
           ,[0.9,0.0,0.0,0.7,0.0,0.2,0.0,0.7,0.0,0.2]
           ,[0.9,0.0,0.0,0.7,0.2,0.2,0.0,0.7,0.0,0.0]
           ,[0.9,0.0,0.0,0.7,0.0,0.2,0.2,0.7,0.2,0.0]
           ,[0.9,0.2,0.2,0.7,0.2,0.2,0.2,0.7,0.2,0.2]
           ,[0.9,0.2,0.2,0.7,0.2,0.2,0.2,0.7,0.0,0.0]
           ,[0.9,0.0,0.0,0.7,0.2,0.2,0.2,0.7,0.0,0.0]
           ,[0.9,0.0,0.4,0.0,0.4,0.0,0.4,0.0,0.4,0.0]
           ,[0.9,0.0,0.0,0.4,0.0,0.0,0.4,0.2,0.4,0.2]
           ,[0.9,0.0,0.2,0.7,0.0,0.2,0.0,0.7,0.0,0.0]
           ,[0.9,0.0,0.0,0.7,0.0,0.0,0.0,0.7,0.0,0.0]
           ,[0.9,0.7,0.7,0.0,0.0,0.2,0.2,0.2,0.0,0.0]
           ,[0.9,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0]] 30
    {- tehai -}
    ,sq_f [2.0,0.0,0.2,0.5,0.0,0.2,0.9
          ,1.5,0.0,0.2,0.5,0.0,0.2,0.9
          ,1.5,0.0,0.2,0.5,0.0,0.2] 3
    {- sam -}
    ,sq_f [5.0] 1]

mri_begin :: Transport m => m ()
mri_begin = do
  play (out 0 mri_drone)
  let sy = synthdef "mridangam" (out 0 mri_mridangam)
      a = concat (mri_a_seq lseq (lrand 'α'))
  nrt_play (P.nbind1 (sy,100,[("amp",a),("dur",repeat (1/8))]))

mri_run :: IO ()
mri_run = withSC3 mri_begin

-- * bowed string (jmcc)

bowed_string_m :: UId m => m UGen
bowed_string_m = do
  let root = 5
      scale = map (+ root) [0,2,4,5,7,9,11]
      oct = [24,36,48,60,72,84]
  n0 <- clone 2 (brownNoiseM AR)
  r0 <- expRandM 0.125 0.5
  r1 <- randM 0.7 0.9
  r2 <- sequence (replicate 12 (randM 1.0 3.0))
  f <- midiCPS `fmap` (liftA2 (+) (lchooseM scale) (lchooseM oct))
  n1 <- lfNoise1M KR r0
  let x = n0 * 0.007 * max 0 (n1 * 0.6 + 0.4)
      geom n i z = take n (iterate (* z) i)
      iota n i z = take n (iterate (+ z) i)
      d = klankSpec (iota 12 f f) (geom 12 1 r1) r2
      k = klank x 1 0 1 d
  return (softClip (k * 0.1))

bowed_string :: UGen
bowed_string = uid_st_eval bowed_string_m

bowed_string_ot :: IO ()
bowed_string_ot = O.overlapTextureU (5,2,12,maxBound) bowed_string

-- * demanding studies (jmcc)

demanding_studies :: UGen
demanding_studies =
  let s1 = drand 'α' dinf (mce [72, 75, 79, 82])
      s2 = drand 'β' 1 (mce [82, 84, 86])
      s3 = dseq 'γ' dinf (mce [72, 75, 79, s2])
      x = mouseX KR 5 13 Linear 0.2
      tr = impulse KR x 0
      f = demand tr 0 (mce2 (midiCPS (s1 - 12)) (midiCPS s3))
      o1 = sinOsc AR (f + mce2 0 0.7) 0
      o2 = saw AR (f + mce2 0 0.7) * 0.3
      o3 = cubed (distort (log (distort (o1 + o2))))
  in o3 * 0.1

-- * wind metals (jmcc)

wind_metals_m :: UId m => m UGen
wind_metals_m = do
  let n = 6
  base <- expRandM 60 4000
  rng <- randM 500 8000
  n0 <- clone 2 (brownNoiseM AR)
  r0 <- expRandM 0.125 0.5
  n1 <- lfNoise1M KR r0
  f <- sequence (replicate n (randM base (base + rng)))
  dt <- sequence (replicate n (randM 0.1 2))
  let exc = n0 * 0.007 * max 0 (n1 * 0.75 + 0.25)
      k = klankSpec f (replicate n 1) dt
      s = klank exc 1 0 1 k
  return (softClip (s * 0.1))

wind_metals :: UGen
wind_metals = uid_st_eval wind_metals_m

wind_metals_ot :: IO ()
wind_metals_ot = O.overlapTextureU (5,2,12,maxBound) wind_metals

-- * tank (jmcc)

tank_pling :: UGen
tank_pling =
    let d = dust 'α' AR 0.2
        f = expRand 'β' 300 2200
        p = rand 'γ' (-1) 1
        s1 = cubed (fSinOsc AR f 0)
        s2 = decay2 d 0.1 0.5 * 0.1 * s1
    in pan2 s2 p 1

tank_bang :: UGen
tank_bang =
    let d = dust 'δ' AR 0.01
        n = brownNoise 'ε' AR
    in pan2 (decay2 d 0.04 0.3 * n) 0 1

tank_f :: UGen -> UGen
tank_f i =
    let l0 = localIn 2 AR (mce2 0 0) * 0.98
        l1 = onePole l0 0.33
        (l1l,l1r) = unmce2 l1
        l2 = rotate2 l1l l1r 0.23
        l3 = allpassN l2 0.05 (RDU.randN 2 'θ' 0.01 0.05) 2
        l4 = delayN l3 0.3 (mce2 0.17 0.23)
        l5 = allpassN l4 0.05 (RDU.randN 2 'ι' 0.03 0.15) 2
        l6 = leakDC l5 0.995
        l7 = l6 + i
    in mrg [l7,localOut l7]

{- > let u = Protect.useq 'λ' 4 r_allpass (soundIn 0) -}
r_allpass :: UGen -> UGen
r_allpass i = allpassN i 0.03 (RDU.randN 2 'ζ' 0.005 0.02) 1

{- <http://create.ucsb.edu/pipermail/sc-users/2004-April/009692.html> -}
tank :: UGen
tank =
  let s = tank_bang + mix (Protect.uclone_all 'κ' 8 tank_pling)
  in tank_f (Protect.useq_all 'λ' 4 r_allpass s)

tank_rev :: UGen -> UGen
tank_rev = tank_f . Protect.useq_all 'λ' 4 r_allpass

tank_pling_m :: UId m => m UGen
tank_pling_m = do
  d <- dustM AR 0.2
  f <- expRandM 300 2200
  p <- randM (-1) 1
  let s1 = cubed (fSinOsc AR f 0)
      s2 = decay2 d 0.1 0.5 * 0.1 * s1
  return (pan2 s2 p 1)

tank_bang_m :: UId m => m UGen
tank_bang_m = do
  d <- dustM AR 0.01
  n <- brownNoiseM AR
  return (pan2 (decay2 d 0.04 0.3 * n) 0 1)

r_allpass_m :: UId m => UGen -> m UGen
r_allpass_m i = do
  r <- clone 2 (randM 0.005 0.02)
  return (allpassN i 0.03 r 1)

tank_f_m :: UId m => UGen -> m UGen
tank_f_m i = do
  r1 <- clone 2 (randM 0.01 0.05)
  r2 <- clone 2 (randM 0.03 0.15)
  let l0 = localIn' 2 AR * 0.98
      l1 = onePole l0 0.33
      (l1l,l1r) = unmce2 l1
      l2 = rotate2 l1l l1r 0.23
      l3 = allpassN l2 0.05 r1 2
      l4 = delayN l3 0.3 (mce [0.17,0.23])
      l5 = allpassN l4 0.05 r2 2
      l6 = leakDC l5 0.995
      l7 = l6 + i
  return (mrg [l7,localOut l7])

mix_replicate_m :: Monad m => Int -> m UGen -> m UGen
mix_replicate_m n = mixFillM n . (const :: m UGen -> Int -> m UGen)

tank_m :: UId m => m UGen
tank_m = tank_f_m =<< chainM 4 r_allpass_m =<< tank_bang_m .+. mix_replicate_m 8 tank_pling_m

-- * plucked strings (jmcc)

plucked_strings_m :: UId m => m UGen
plucked_strings_m = do
  let dt = do r0 <- randM 60 90
              return (1 / midiCPS (floorE r0))
      i = do r0 <- randM 2 2.2
             n0 <- dustM AR 0.5
             r1 <- randM 0.05 0.15
             r2 <- randM 0 (pi * 2)
             r3 <- iRandM 0 2
             let s0 = impulse AR r0 0 * 0.3
                 s1 = n0 * 0.3
                 s2 = impulse AR (sinOsc KR r1 r2 * 5 + 5.2) 0 * 0.3
             return (select r3 (mce [s0,s1,s2]))
      s = do n0 <- pinkNoiseM AR
             r1 <- randM (-1) 1
             im <- i
             dt' <- dt
             let t = decay im 0.1 * n0 * 0.1
             return (pan2 (combL t dt' dt' 4) r1 1)
  fmap sum (sequence (replicate 5 s))

plucked_strings :: UGen
plucked_strings = uid_st_eval plucked_strings_m

-- * theremin (jmcc)

theremin :: UGen
theremin =
  let m = 7
      detune = 0
      x = mouseX KR 0 0.6 Linear 0.2
      y = mouseY KR 4000 200 Exponential 0.8
      f = y + detune
      f' = f + f * sinOsc AR m 0 * 0.02
      a = sinOsc AR f' 0 * x
  in pan2 a 0 1

-- * snare-909 (jmcc)

snare_909 :: UGen -> UGen
snare_909 tr =
  let n = whiteNoise 'α' AR
      v = tRand 'β' 0.25 1.0 tr
      e a b = envGen AR tr 1 0 1 DoNothing (envPerc a b)
      e1 = e 0.0005 0.055
      e2 = e 0.0005 0.075
      e3 = e 0.0005 0.4
      e4 = e 0.0005 0.283
      t1 = lfTri AR 330 0
      t2 = lfTri AR 185 0
      x1 = lpf n 7040 * 0.1 + v
      x2 = hpf x1 523
      m1 = t1 * e1 * 0.25 + t2 * e2 * 0.25
      m2 = x1 * e3 * 0.20 + x2 * e4 * 0.20
  in m1 + m2

snare_909_mouse :: UGen
snare_909_mouse =
    let x = mouseX KR 1 4 Linear 0.2
        y = mouseY KR 0.25 0.75 Exponential 0.2
        t = impulse KR (3 * x) 0
    in pan2 (snare_909 t) 0 y

-- * birds (jmcc)

birds_m :: UId m => m UGen
birds_m = do
  let node = do r1 <- randM 94.0 102.0
                r2 <- randM (-1.5) 1.5
                r3 <- randM 0.0 1.0
                r4 <- randM 11.0 15.0
                r5 <- randM 0.0 1.0
                r6 <- randM 12.0 15.6
                r7 <- randM 0.0 1.0
                r8 <- randM (-1.0) 1.0
                let f = r1 + lag (lfSaw AR (7 + r2) r3 * r4) 0.1
                    a = lfPulse KR (1.0 / r6) r7 0.16 * 0.05
                    b = sinOsc AR (midiCPS f) r5 * a
                return (rotate2 b (silent 1) r8)
      apf_r i = do r1 <- randM 0.0 0.06
                   r2 <- randM 0.7 2.0
                   return (allpassL i 0.07 r1 r2)
  d <- return . sum =<< sequence (replicate 6 node)
  w <- chainM 12 apf_r d
  return (d * 0.7 + w * 0.3)

birds :: UGen
birds = uid_st_eval birds_m

-- * spe (jmcc) / rd

spe_m :: UId m => m UGen
spe_m = do
  let rapf i = do r <- clone 2 (randM 0 0.05)
                  return (allpassN i 0.05 r 4)
      src = do let t = impulse KR 9 0
                   e = envGen KR t 0.1 0 1 DoNothing (envPerc 0.1 1)
                   s = mce [00,03,02,07
                           ,08,32,16,18
                           ,00,12,24,32]
               n <- lfNoise1M KR 1
               m <- dseqM dinf s
               let f = midiCPS (demand t 0 m + 32)
                   o = lfSaw AR f 0 * e
                   rq = midiCPS (n * 36 + 110)
               return (rlpf o rq 0.1)
  chainM 4 rapf =<< src

spe :: UGen
spe = uid_st_eval spe_m
