module Sound.SC3.Graphs.JMcC where

import Control.Applicative {- base -}
import Control.Concurrent {- base -}
import Control.Monad {- base -}
import Prelude {- base -}

import qualified System.Random as R {- random -}

import qualified Control.Monad.Random as MR {- MonadRandom -}

import Sound.OSC {- hosc -}
import Sound.SC3 as SC3 {- hsc3 -}
import Sound.SC3.Common.Monad.Operators {- hsc3 -}
import Sound.SC3.UGen.Protect {- hsc3 -}

import qualified Sound.SC3.Lang.Collection as C {- hsc3-lang -}
import qualified Sound.SC3.Lang.Control.OverlapTexture as O {- hsc3-lang -}
import qualified Sound.SC3.Lang.Pattern.Bind as P {- hsc3-lang -}
import qualified Sound.SC3.Lang.Random.Gen as R.Gen {- hsc3-lang -}
import qualified Sound.SC3.Lang.Random.ID as R {- hsc3-lang -}
import qualified Sound.SC3.Lang.Random.Monad as MR {- hsc3-lang -}

import qualified Sound.SC3.UGen.Bindings.DB.RDU as RDU {- sc3-rdu -}

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

-- * why supercollider (jmcc) #0

why_supercollider :: UGen
why_supercollider =
    let r = resonz (dust 'α' AR 0.2 * 50) (rand 'β' 200 3200) 0.003
        s = mix (uclone 'γ' 10 r)
        z = delayN s 0.048 0.048
        c = combL z 0.1 (lfNoise1 'δ' KR (rand 'ε' 0 0.1) * 0.04 + 0.05) 15
        y = mix (uclone 'ζ' 7 c)
        f i = allpassN i 0.05 (RDU.randN 2 'η' 0 0.05) 1
        x = useq 'θ' 4 f y
    in s + 0.2 * x

{-

> let dir = "/home/rohan/sw/hsc3-graphs/scsyndef"
> synthdefWrite (synthdef "why-supercollider" (out 0 why_supercollider)) dir

-}

-- * analog bubbles (jmcc) #1

analog_bubbles :: UGen
analog_bubbles =
  let o = lfSaw KR (mce2 8 7.23) 0 * 3 + 80
      f = lfSaw KR 0.4 0 * 24 + o
      s = sinOsc AR (midiCPS f) 0 * 0.04
  in combN s 0.2 0.2 4

{-

> putStrLn $ synthstat analog_bubbles
> let g = synthdef_to_graphdef (synthdef "analog-bubbles" (out 0 analog_bubbles))
> import qualified Sound.SC3.Server.Graphdef as G
> putStrLn $ G.graphdef_stat g

> let dir = "/home/rohan/sw/hsc3-graphs/scsyndef"
> synthdefWrite (synthdef "analog-bubbles" (out 0 analog_bubbles)) dir

-}

-- * lfo modulation (jmcc) #1

lfo_modulation :: UGen
lfo_modulation =
  let o = fSinOsc KR 0.05 0 * 80 + 160
      p = fSinOsc KR (mce2 0.6 0.7) 0 * 3600 + 4000
      s = rlpf (lfPulse AR o 0 0.4 * 0.05) p 0.2
  in combL s 0.3 (mce2 0.2 0.25) 2

-- * hell is busy (jmcc) #1

hib :: UGen
hib =
    let o = fSinOsc AR (400 + rand 'α' 0 2000) 0
        a = lfPulse KR (1 + rand 'β' 0 10.0) 0 (rand 'γ' 0 0.7) * 0.04
    in pan2 (o * a) (rand 'δ' (-1) 1) 1

hib_ot :: IO ()
hib_ot = O.overlapTextureU (4,4,8,maxBound) hib

-- * pond life (jmcc) #1

pond_life :: UGen
pond_life =
    let f0 = 20 + rand 'α' 0 30
        f1 = fSinOsc KR f0 0 * rand 'β' 100 400 + linRand 'γ' 500 2500 0
        a = lfPulse KR (3 / rand 'δ' 1 9) 0 (rand 'ε' 0.2 0.5) * 0.04
    in pan2 (sinOsc AR f1 0 * a) (rand 'ζ' (-1) 1) 0.5

pond_life_ot :: IO ()
pond_life_ot = O.overlapTextureU (8,8,4,maxBound) pond_life

pond_life_m :: UId m => m UGen
pond_life_m = do
  n0 <- randM 0 30
  let f0 = 20 + n0
  n1 <- randM 100 400
  n2 <- linRandM 500 2500 0
  let f1 = fSinOsc KR f0 0 * n1 + n2
  n3 <- randM 1 9
  n4 <- randM 0.2 0.5
  let a = lfPulse KR (3 / n3) 0 n4 * 0.04
  n5 <- randM (-1) 1
  return (pan2 (sinOsc AR f1 0 * a) n5 0.5)

-- * alien froggies (jmcc) #1

alien_froggies :: UGen -> UGen
alien_froggies r =
    let r' = fold (r * exp (linRand 'α' (-0.2) 0.2 0)) 1 30
        o = formant AR r' (expRand 'β' 200 3000) (rand 'γ' 0 9 * r' + r')
    in o * 0.05

alien_froggies_11 :: UGen
alien_froggies_11 = alien_froggies 11

alien_froggies_ot :: IO ()
alien_froggies_ot = O.overlapTextureU (0.25,0.5,5,maxBound) alien_froggies_11

-- * random sine waves (jmcc) #1

rsw :: UGen
rsw =
    let f = rand 'α' 0 2000
        o = fSinOsc AR f 0 * 0.02
    in pan2 o (rand 'β' (-1) 1) 1

rsw_ot :: IO ()
rsw_ot = O.overlapTextureU (2,5,12,maxBound) rsw

-- * random pulsations (jmcc) #1

rp :: UGen
rp =
    let e = envLinen 2 5 2 0.02
        o1 = fSinOsc AR (rand 'α' 0 2000) 0 * envGen KR 1 1 0 1 DoNothing e
        o2 = sinOsc AR (linRand 'β' 8 88 0) 0
        o3 = sinOsc KR (rand 'γ' 0.3 0.8) (rand 'δ' 0 (2 * pi)) * 0.7
    in pan2 (o1 `amClip` o2) o3 1

rp_st :: IO ()
rp_st = O.spawnTextureU (const (9/8),maxBound) rp

-- * moto rev (jmcc) #1

moto_rev :: UGen
moto_rev =
  let f = sinOsc KR 0.2 0 * 10 + 21
      s = lfPulse AR f (mce2 0 0.1) 0.1
  in clip2 (rlpf s 100 0.1) 0.4

-- * scratchy (jmcc) #1

scratchy :: UGen
scratchy =
  let n = brownNoise 'α' AR * 0.5 - 0.49
      n' = uclone 'β' 2 n
  in rhpf (max n' 0 * 20) 5000 1

scratchy_m :: UId m => m UGen
scratchy_m = do
  n <- clone 2 (brownNoiseM AR)
  let f = max (n * 0.5 - 0.49) 0 * 20
  return (rhpf f 5000 1)

-- * tremulate (jmcc) #1

tremulate :: UGen
tremulate =
    let f = rand 'α' 500 900
        o = fSinOsc AR (f * mce [1,1.2,1.5,1.8]) 0
        r = RDU.randN 4 'β' 30 90
        a = max 0 (lfNoise2 'γ' KR r) * 0.1
        l = RDU.randN 4 'δ' (-1) 1
    in mix (pan2 o l a)

tremulate_pp :: UGen -> UGen
tremulate_pp i = combN i 0.1 0.1 1

tremulate_xt :: IO ()
tremulate_xt = O.xfadeTextureU_pp (0.5,2,maxBound) tremulate 2 tremulate_pp

tremulate_m :: UId m => m UGen
tremulate_m = do
  f <- randM 500 900
  let o = fSinOsc AR (f * mce [1,1.2,1.5,1.8]) 0
  r <- randM 30 90
  n <- clone 4 (lfNoise2M KR r)
  let a = max 0 (n * 0.1)
  l <- clone 4 (randM (-1) 1)
  return (mix (pan2 o l a))

-- * reso-pulse (jmcc) #1

reso_pulse :: UGen
reso_pulse =
    let f = midiCPS (lchoose 'α' [25,30,34,37,41,42,46,49,53,54,58,61,63,66])
        f' = 2 * f + rand2 'β' 0.5
    in (lfPulse AR f 0 0.2 + lfPulse AR f' 0 0.2) * 0.02

reso_pulse_pp :: UGen -> UGen
reso_pulse_pp z =
    let lfoFreq = 6
        lfo = lfNoise0 'γ' KR lfoFreq * 1000 + 1200
        x = mouseX KR 0.2 0.02 Exponential 0.2
        left = rlpf z lfo x
        delayTime = 2 / lfoFreq
        right = delayN left delayTime delayTime
    in mce2 left right

reso_pulse_ot :: IO ()
reso_pulse_ot = O.overlapTextureU_pp (4,2,4,maxBound) reso_pulse 1 reso_pulse_pp

-- * sprinkler (jmcc) #1

sprinkler :: UGen
sprinkler =
  let f = lfPulse KR 0.09 0 0.16 * 10 + 7
      t = lfPulse KR f 0 0.25 * 0.1
      n = whiteNoise 'α' AR
  in bpz2 (n * t)

sprinkler_m :: UId m => m UGen
sprinkler_m = do
  n <- whiteNoiseM AR
  let f = lfPulse KR 0.09 0 0.16 * 10 + 7
      t = lfPulse KR f 0 0.25 * 0.1
  return (bpz2 (n * t))

-- * sprinkler mouse (jmcc) #1

sprinkler_mouse :: UGen
sprinkler_mouse =
    let n = whiteNoise 'α' AR
        f = mouseX KR 0.2 50 Linear 0.2
        t = lfPulse KR f 0 0.25 * 0.1
    in bpz2 (n * t)

-- * harmonic swimming (jmcc) #1

harmonic_swimming :: UGen
harmonic_swimming =
  let a = 0.02
      f = 50
      p = 20::Int
      l = line KR 0 (- a) 60 DoNothing
      o h = let r = RDU.randN 2 h 2 8
                n = lfNoise1 h KR r
                e = max 0 (n * a + l)
            in fSinOsc AR (f * (fromIntegral h + 1)) 0 * e
  in sum (map o [0..p])

harmonic_swimming_m :: UId m => m UGen
harmonic_swimming_m =
    let a = 0.02
        f = 50
        p = 20
        l = line KR 0 (- a) 60 DoNothing
        o h = do r <- clone 2 (randM 2 8)
                 n <- lfNoise1M KR r
                 let e = max 0 (n * a + l)
                 return (fSinOsc AR (f * (h + 1)) 0 * e)
    in fmap sum (mapM o [0..p])

-- * harmonic tumbling (jmcc) #1

harmonic_tumbling :: UGen
harmonic_tumbling =
  let f = 80
      p = 10::Int
      t = xLine KR (mce2 10 11) 0.1 60 DoNothing
      o h = let n = dust h KR t
                r = rand h 0.25 0.5
                e = decay2 (n * 0.02) 0.005 r
            in fSinOsc AR (f * (fromIntegral h + 1)) 0 * e
  in sum (map o [0..p])

harmonic_tumbling_m :: UId m => m UGen
harmonic_tumbling_m = do
  let f = 80
      p = 10
      t = xLine KR (mce2 10 11) 0.1 60 DoNothing
      o h = do n <- dustM KR t
               r <- randM 0 0.5
               let e = decay2 (n * 0.02) 0.005 r
               return (fSinOsc AR (f * (h + 1)) 0 * e)
  fmap sum (mapM o [0..p])

-- * rails (jmcc) #2

rails :: UGen
rails =
    let n = 20 {- resonant modes -}
        e = dust 'α' AR 100 * 0.04 {- excitation -}
        f = xLine KR 3000 300 8 DoNothing {- sweep filter down -}
        l = line KR (rand2 'β' 1) (rand2 'γ' 1) 8 DoNothing {- sweep pan -}
        r = uclone_seq 'δ' n (200 + linRand 'ε' 0 3000 0) {- resonant frequencies -}
        a = replicate n 1
        t = uclone_seq 'ζ' n (0.2 + rand 'η' 0 1) {- ring times -}
        k = klank (resonz e f 0.2) 1 0 1 (klankSpec r a t)
    in pan2 k l 1

rails_ot :: IO ()
rails_ot = O.overlapTextureU (3,2,4,maxBound) rails

-- * bouncing objects (jmcc) #2

bouncing_objects :: UGen
bouncing_objects =
  let imp_frq = xLine KR (5 + rand 'α' (-2) 2) 600 4 DoNothing
      imp_amp = xLine KR 0.09 0.000009 4 DoNothing
      imp = impulse AR imp_frq 0 * imp_amp
      exc = decay imp 0.001
      flt_frq = RDU.randN 4 'β' 400 8400
      flt_amp = RDU.randN 4 'γ' 0 1
      flt_rtm = RDU.randN 4 'δ' 0.01 0.11
      flt = klank exc 1 0 1 (klankSpec_mce flt_frq flt_amp flt_rtm)
      loc = pan2 flt (rand 'ε' (-1) 1) 1
      e = Envelope [1,1,0] [3,0.001] (replicate 2 EnvLin) Nothing Nothing 0
  in loc * envGen KR 1 1 0 1 RemoveSynth e

bouncing_objects_st :: IO ()
bouncing_objects_st = O.spawnTextureU (\i -> R.rrand i 0.6 1.6,maxBound) bouncing_objects

-- * lots-o-sins (jmcc) #2

lots_o_sins :: UGen
lots_o_sins =
    let n = 60 {- n sines in each channel (twice as many during cross-fade) -}
        f0 = RDU.randN n 'a' 40 10000
        f1 = RDU.randN n 'b' 40 10000
        mk_k x = mce (replicate n x)
        o1 = klang AR 1 0 (klangSpec_mce f0 (mk_k 1) (mk_k 0))
        o2 = klang AR 1 0 (klangSpec_mce f1 (mk_k 1) (mk_k 0))
    in mce2 o1 o2 * (0.1 / constant n)

lots_o_sins_xt :: IO ()
lots_o_sins_xt = O.xfadeTextureU (4,4,maxBound) lots_o_sins

-- * clustered sines (jmcc) #2

cs :: UGen
cs =
    let n = 80
        f1 = rand 'α' 100 1100
        f2 = 4 * f1
        sp = let y = uclone_seq 'β' n (f1 + rand 'γ' 0 f2)
             in klangSpec y (map (f1 /) y) (replicate n 0)
    in uclone 'δ' 2 (klang AR 1 0 sp * (0.3 / fromIntegral n))

cs_xt :: IO ()
cs_xt = O.xfadeTextureU (4,4,maxBound) cs

cs_m :: UId m => m UGen
cs_m = do
  let n = 80
  f1 <- randM 100 1100
  let f2 = 4 * f1
  y <- replicateM n (f1 +. randM 0 f2)
  let sp = klangSpec y (map (f1 /) y) (replicate n 0)
  return (klang AR 1 0 sp * (0.3 / fromIntegral n))

-- * resonators harmonic series (jmcc) #2

rhs :: UGen
rhs =
    let p = 12
        noise = brownNoise 'α' AR * 0.001
        rat = [1.0,1.125,1.25,1.333,1.5,1.667,1.875,2.0,2.25,2.5,2.667,3.0,3.333,3.75,4.0]
        freq = lchoose 'β' rat * 120
        resFreqs = zipWith (+) (C.series p freq freq) (uclone_seq 'γ' p (rand2 'δ' 0.5))
        spec = klankSpec
               resFreqs
               (map (\i -> 1 / (constant i + 1)) [0 .. p - 1])
               (uclone_seq 'ε' p (rand 'ζ' 0.5 4.5))
    in uclone 'η' 2 (klank noise 1 0 1 spec)

rhs_xt :: IO ()
rhs_xt = O.xfadeTextureU (1,7,maxBound) rhs

-- * swept resonant noise (jmcc) #2

srn :: UGen
srn =
  let p = 10
      n = whiteNoise 'α' AR * 0.007
      f = midiCPS (fSinOsc KR (rand 'β' 0.1 0.3) 0 * rand 'γ' 0 24 + rand 'δ' 36 84)
      sw = resonz n f 0.1
      spec = klankSpec_mce
             (RDU.linRandN p 'ε' 80 10080 0)
             (mce (replicate p 1))
             (RDU.randN p 'ζ' 0.5 2.5)
  in uclone 'η' 2 (klank sw 1 0 1 spec)

srn_ot :: IO ()
srn_ot = O.overlapTextureU (4,4,5,maxBound) srn

-- * coolant (jmcc) #2

coolant :: UGen
coolant =
    let p = 20
        s = onePole (uclone 'α' p (brownNoise 'β' AR) * 0.0015) 0.95
        n = replicate p 1
        sp = mce [klankSpec (uclone_seq 'γ' p (rand 'δ' 40 2400)) n n
                 ,klankSpec (uclone_seq 'ε' p (rand 'ζ' 40 2400)) n n]
    in klank s 1 0 1 (mceTranspose sp)

coolant_ot :: IO ()
coolant_ot = O.overlapTextureU (4,4,2,maxBound) coolant

-- * pulsing bottles (jmcc) #2

pulsing_bottles :: UGen
pulsing_bottles =
    let r = let n = whiteNoise 'α' AR
                r0 = rand 'α' 4 14
                r1 = rand 'α' 0 0.7
                r2 = rand 'α' 400 7400
            in resonz (n * lfPulse KR r0 0 0.25 * r1) r2 0.01
        s = let f = rand 'β' 0.1 0.5
                p = rand 'β' 0 (pi * 2)
             in sinOsc KR f p
    in sum (zipWith3 pan2 (uclone_seq 'α' 6 r) (uclone_seq 'β' 6 s) (repeat 1))

pulsing_bottles_ot :: IO ()
pulsing_bottles_ot = O.overlapTextureU (4,4,4,maxBound) pulsing_bottles

pulsing_bottles_m :: UId m => m UGen
pulsing_bottles_m = do
  let r = do n <- whiteNoiseM AR
             r0 <- randM 4 14
             r1 <- randM 0 0.7
             r2 <- randM 400 7400
             return (resonz (n * lfPulse KR r0 0 0.25 * r1) r2 0.01)
      s = do f <- randM 0.1 0.5
             p <- randM 0 (pi * 2)
             return (sinOsc KR f p)
      u = liftM2 (\x y -> pan2 x y 1) r s
  fmap sum (sequence (replicate 6 u))

-- * what was i thinking? (jmcc) #2

what_was_i_thinking_m :: UId m => m UGen
what_was_i_thinking_m = do
  n0 <- lfNoise1M KR 0.2
  n1 <- lfNoise1M KR 0.157
  let p = pulse AR f (n1 * 0.4 + 0.5) * 0.04
      i = lfPulse AR 0.1 0 0.05 * impulse AR 8 0 * 500
      d = decay i 2
      f = max (sinOsc KR 4 0 + 80) d
      z = rlpf p (n0 * 2000 + 2400) 0.2
      c x = do r <- randM 0 0.3
               n <- lfNoise1M KR r
               return (combL x 0.06 (n * 0.025 + 0.035) 1)
      y = z * 0.6
  z0 <- clone 2 (c y)
  z1 <- clone 2 (c y)
  return (z + mce [mix z0,mix z1])

what_was_i_thinking :: UGen
what_was_i_thinking = uid_st_eval what_was_i_thinking_m

-- * narrow band filtered crackle noise (jmcc) #2

nbfcn :: UGen
nbfcn =
    let e = envLinen 2 5 2 1
        rf1 = rand 'α' 0 2000 + 80
        rf2 = rf1 + (rand2 'β' 0.2 * rf1)
        rf = xLine KR rf1 rf2 9 DoNothing
        c = crackle AR 1.97 + rand 'γ' 0 0.03 * 0.15
    in pan2 (resonz c rf 0.2) (rand2 'δ' 1) (envGen AR 1 1 0 1 RemoveSynth e)

nbfcn_st :: IO ()
nbfcn_st = O.spawnTextureU (const 2,maxBound) nbfcn

-- * resonant dust (jmcc) #2

resonant_dust :: UGen
resonant_dust =
    let rf = let st = rand 'α' 80 2080
                 en = st + (rand 'β' (-0.5) 0.5 * st)
             in xLine KR st en 9 DoNothing
        d = dust 'γ' AR (rand 'δ' 50 850) * 0.3
    in pan2 (resonz d rf 0.1) (rand 'ε' (-1) 1) 1

resonant_dust_ot :: IO ()
resonant_dust_ot = O.overlapTextureU (5,2,9,maxBound) resonant_dust

-- * police state (jmcc) #2

police_state_nd :: UGen
police_state_nd =
    let n = lfNoise2 'α' AR (rand 'β' 80 120)
        f = sinOsc KR (rand 'γ' 0.02 0.12) (rand 'δ' 0 (pi * 2)) *
            rand 'ε' 0 600 +
            rand 'ζ' 700 1300
    in pan2 (sinOsc AR f 0 * n * 0.1) (rand 'η' (-1) 1) 1

police_state :: UGen
police_state =
  let ns = uclone 'θ' 4 police_state_nd
      n0 = uclone 'ι' 2 (lfNoise2 'κ' KR 0.4)
      n1 = lfNoise2 'λ' AR (n0 * 90 + 620)
      n2 = lfNoise2 'μ' KR (mce2 0.3 0.301)
      e = n1 * (n2 * 0.15 + 0.18)
  in combL (mix ns + e) 0.3 0.3 3

police_state_m :: UId m => m UGen
police_state_m = do
  let nd = do r0 <- randM 0.02 0.12
              r1 <- randM 0 (pi * 2)
              r2 <- randM 0 600
              r3 <- randM 700 1300
              r4 <- randM (-1) 1
              r5 <- randM 80 120
              n0 <- lfNoise2M AR r5
              let f = sinOsc KR r0 r1 * r2 + r3
              return (pan2 (sinOsc AR f 0 * n0 * 0.1) r4 1)
  ns <- clone 4 nd
  n0 <- clone 2 (lfNoise2M KR 0.4)
  n1 <- lfNoise2M AR (n0 * 90 + 620)
  n2 <- lfNoise2M KR (mce2 0.3 0.301)
  let e = n1 * (n2 * 0.15 + 0.18)
  return (combL (mix ns + e) 0.3 0.3 3)

-- * uplink (jmcc) #2

uplink :: UGen
uplink =
    let r = rand0
        p0 = lfPulse KR (r 'α' 20) 0 (r 'β' 1)
        p1 = lfPulse KR (r 'γ' 4) 0 (r 'δ' 1) * r 'ε' 8000 + r 'ζ' 2000
        f = mix (uclone 'η' 2 (p0 * p1))
    in pan2 (lfPulse AR f 0 0.5 * 0.04) (rand 'θ' (-0.8) 0.8) 1

uplink_ot :: IO ()
uplink_ot = O.overlapTextureU (4,1,5,maxBound) uplink

-- * data space (jmcc) #2

data_space :: UGen
data_space =
    let r e = rand e 0
        p0 = lfPulse KR (r 'α' 200) 0 (r 'β' 1)
        p1 = lfPulse KR (r 'γ' 40) 0 (r 'δ' 1) * r 'ε' 8000 + r 'ζ' 2000
        p2 = lfPulse KR (r 'η' 20) 0 (r 'θ' 1)
        p3 = lfPulse KR (r 'ι' 4) 0 (r 'κ' 1) * r 'λ' 8000 + r 'μ'  2000
        p4 = lfPulse KR (r 'ν' 20) 0 (r 'ξ' 1)
        p5 = lfPulse KR (r 'ο' 4) 0 (r 'π' 1) * r 'ρ' 8000 + r 'σ'  2000
        f = p0 * p1 + p2 * p3 + p4 * p5
        dt = rand 'τ' 0.15 0.35
        o = lfPulse AR f 0 0.5 * 0.04
        l = lfNoise0 'υ' KR (r 'φ' 3) * 0.8
    in combL (pan2 o l 1) dt dt 3

data_space_ot :: IO ()
data_space_ot = O.overlapTextureU (1,6,4,maxBound) data_space

-- * cymbalism (jmcc) #2

cymbalism_m :: UId m => m UGen
cymbalism_m = do
  let p = replicate 15
  f1 <- randM 500 2500
  f2 <- randM 0 8000
  let y = do f <- sequence (p (randM f1 (f1 + f2)))
             rt <- sequence (p (randM 1 5))
             return (klankSpec f (p 1) rt)
  z <- clone 2 y
  n <- fmap (* 0.03) (whiteNoiseM AR)
  tf <- randM 0.5 3.5
  let t = impulse AR tf 0
      s = decay t 0.004 * n
  return (klank s 1 0 1 (mceTranspose z))

cymbalism :: UGen
cymbalism = uid_st_eval cymbalism_m

cymbalism_ot :: IO ()
cymbalism_ot = O.overlapTextureU (3,6,6,maxBound) cymbalism

-- * cymbalism accelerando (jmcc) #2

enumFromN :: Enum a => a -> Int -> [Int]
enumFromN e i = let j = fromEnum e in [j .. j + i]

cymbalism_accellerando :: UGen
cymbalism_accellerando =
  let y n = let f1 = rand n 500 2500
                f2 = rand n 0 8000
                f = map (\e -> rand e f1 (f1 + f2)) (enumFromN n 15)
                rt = map (\e -> rand e 1 5) (enumFromN n 15)
          in klankSpec f (replicate 15 1) rt
      z = mce2 (y 'α') (y 'β')
      w = whiteNoise 'γ' AR * 0.02
      tf = xLine KR (linRand 'δ' 0.5 4.5 0) (rand 'ε' 0.5 35.5) 12 DoNothing
      t = impulse AR tf 0
      s = decay t 0.004 * w
  in klank s 1 0 1 (mceTranspose z)

cymbalism_accellerando_ot :: IO ()
cymbalism_accellerando_ot = O.overlapTextureU (4,4,4,maxBound) cymbalism_accellerando

-- * ring modulated klank (jmcc) #2

rmk :: UGen
rmk =
    let p = 8
        k = let sp = klankSpec_mce (RDU.randN p 'α' 100 10000)
                                   (mce (replicate p 1))
                                   (RDU.randN p 'α' 0.2 1)
            in klank (dust 'α' AR 20 * 0.02) 1 0 1 sp
        f = lfNoise2 'α' KR (rand 'α' 0.1 0.4) * 200 + rand 'α' 350 400
    in pan2 (sinOsc AR f 0 * k) (rand 'α' (-1) 1) 1

rmk_ot :: IO ()
rmk_ot = O.overlapTextureU (4,4,4,maxBound) rmk

-- * analogue daze (jmcc) #3

analogue_daze :: UGen
analogue_daze =
    let pattern = [55,63,60,63,57,65,62,65]
        f k octave clockRate pwmrate fltrate =
            let trg = impulse KR clockRate 0
                pattern' = map (midiCPS .  (+ (12 * octave))) pattern
                sq = dsequ 'α' pattern' trg
                pwm = sinOsc KR pwmrate (rand (k,'β') 0 (2 * pi)) * 0.4 + 0.5
                cf = sinOsc KR fltrate (rand (k,'γ') 0 (2 * pi)) * 1400 + 2000
            in rlpf (lfPulse AR (lag sq 0.05) 0 pwm * 0.1) cf (1/15)
        a = lfNoise0 'δ' AR (lfNoise1 'ε' KR 0.3 * 6000 + 8000) * (mce2 0.07 0.08)
        x = decay (impulse AR 2 0) 0.15 * a
        g = mce [f 'ζ' 1 8 0.31 0.2,f 'η' 0 2 0.13 0.11] + x
        z = 0.4 * (combN g 0.375 0.375 5 + mceReverse g)
        e = envLinen 2 56 2 1
    in z * envGen KR 1 1 0 1 RemoveSynth e

-- * synthetic piano (jmcc) #3

synthetic_piano :: UGen
synthetic_piano =
  let n = iRand 'α' 36 90
      f = rand 'β' 0.1 0.5
      ph = rand 'γ' 0 1
      s = impulse AR f ph * 0.1
      e = decay2 s 0.008 0.04
      c z o = let n0 = lfNoise2 z AR 3000
                  dt = 1 / midiCPS (n + o)
              in combL (n0 * e) dt dt 6
      l = ((n - 36) / 27) - 1
      c_ = sum_opt (zipWith c ['δ'..] [-0.05,0,0.04])
  in pan2 c_ l 1

synthetic_piano_ot :: IO ()
synthetic_piano_ot = O.overlapTextureU (6,0,6,maxBound) synthetic_piano

synthetic_piano_m :: UId m => m UGen
synthetic_piano_m = do
  n <- iRandM 36 90
  f <- randM 0.1 0.5
  ph <- randM 0 1
  let s = impulse AR f ph * 0.1
      e = decay2 s 0.008 0.04
      c i = do n0 <- lfNoise2M AR 3000
               let o = [-0.05,0,0.04] !! i
                   dt = 1 / midiCPS (n + o)
               return (combL (n0 * e) dt dt 6)
      l = ((n - 36) / 27) - 1
  c_ <- mixFillM 3 c
  return (pan2 c_ l 1)

-- * reverberated sine percussion (jmcc) #3

reverberated_sine_percussion_m :: UId m => m UGen
reverberated_sine_percussion_m = do
  let d = 6
      c = 5
      a = 4
      s_ = do n <- dustM AR (2 / constant d)
              r <- randM 0 3000
              return (resonz (n * 50) (200 + r) 0.003)
      x_ i = do r <- clone 2 (randM 0 0.05)
                return (allpassN i 0.05 r 1)
  s <- fmap sum (sequence (replicate d s_))
  y <- do let z = delayN s 0.048 0.48
          r <- clone c (randM 0 0.1)
          n <- lfNoise1M KR r
          return (mix (combL z 0.1 (n * 0.04 + 0.05) 15))
  x <- chainM a x_ y
  return (s + x * 0.2)

reverberated_sine_percussion :: UGen
reverberated_sine_percussion = uid_st_eval reverberated_sine_percussion_m

-- * reverberated noise bursts (jmcc) #3

rnb :: UGen
rnb =
    let s = decay (dust 'α' AR 0.6 * 0.2) 0.15 * pinkNoise 'β' AR
        z = delayN s 0.048 0.048
        y = mix (combL z 0.1 (lfNoise1 'γ' KR (uclone 'δ' 6 (rand 'ε' 0 0.1)) * 0.04 + 0.05) 15)
        f = useq 'ζ' 4 (\i -> allpassN i 0.050 (uclone 'η' 2 (rand 'θ' 0 0.05)) 1)
    in s + f y

-- * analog bubbles with mouse control (jmcc) #3

analog_bubbles_mouse :: UGen
analog_bubbles_mouse =
  let y = mouseY KR 0.1 10 Exponential 0.2 {- lfo 1 rate -}
      x = mouseX KR 2 40 Exponential 0.2  {- lfo 2 rate -}
      o2 = lfSaw KR x 0 * (-3) + 80 {- depth & offset in semitones -}
      o1 = lfSaw KR y 0 * 24 + o2 {- depth in semitones, offset is lfo_2 -}
      f = midiCPS o1 {- convert to frequency -}
      s = sinOsc AR f 0 * 0.04
  in combN s 0.2 0.2 4 {- echoing sine wave -}

-- * berlin 1977 (jmcc) #4

berlin_1977 :: UGen
berlin_1977 =
    let clock_rate = mouseX KR 5 20 Exponential 0.2 {- mouse x controls clock rate -}
        clock_time = 1 / clock_rate
        clock = impulse KR clock_rate 0 {- sequencer trigger -}
        patternList = [55,60,63,62,60,67,63,58]
        note = dsequ 'α' patternList clock {- midi note pattern sequencer -}
        clock_16 = pulseDivider clock 16 0 {- divide clock by 16 -}
        note' = dsequR 'β' [-12,-7,-5,0,2,5] clock_16 + note {- transpose somewhat randomly -}
        freq = midiCPS note' {- convert midi note to cycles per second -}
        env = decay2 clock (0.05 * clock_time) (2 * clock_time)
        amp = env * 0.1 + 0.02 {- amplitude envelope -}
        filt = env * (fSinOsc KR 0.17 0 * 800) + 1400 {- filter frequency -}
        pw = sinOsc KR 0.08 (mce2 0 (0.5 * pi)) * 0.45 + 0.5 {- pulse width LFO(s) -}
        s = pulse AR freq pw * amp
    in combN (rlpf s filt 0.15) 0.2 (mce2 0.2 0.17) 1.5

-- * metal plate (jmcc) #4

metal_plate :: UGen
metal_plate =
    let
        sr = 48000::Double
        n = 4 {- number of delay lines -}
        maxdt = ceiling (sr * 0.03) {- maximum delay time -}
        mk_buf k = asLocalBuf k (replicate maxdt 0)
        buf = map mk_buf [0 .. n - 1] {- buffers for delay lines -}
        tap_tm = uclone_seq 'α' n (rand 'β' 0.015 0.03) {- random tap times -}
        exc_freq = mouseY KR 10 8000 Linear 0.2
        exc_trig = impulse AR 0.5 0 * 0.2
        exc = decay2 exc_trig 0.01 0.2 * lfNoise2 'γ' AR exc_freq {- excitation -}
        del = zipWith (tap 1) buf tap_tm {- delay line taps -}
        flt_freq = mouseX KR 10 5000 Linear 0.2
        flt = map (\i -> lpf i flt_freq * 0.98) del {- tap filters -}
        wr_f b f = recordBuf AR b 0 1 0 1 Loop 1 DoNothing (f + exc)
        wr = zipWith wr_f buf flt {- write to delay lines -}
    in mrg (sum flt : wr)

-- * sample and hold liquidities (jmcc) #4

sample_and_hold_liquidities :: UGen
sample_and_hold_liquidities =
    let r = mouseX KR 1 200 Exponential 0.1
        t = recip r
        c = impulse KR r 0 * 0.4
        cf = mouseY KR 100 8000 Exponential 0.1
        f = latch (whiteNoise 'α' KR * cf * 0.5 + cf) c
        p = latch (whiteNoise 'β' KR) c
        i = pan2 (sinOsc AR f 0 * decay2 c (t * 0.1) (t * 0.9)) p 1
    in combN i 0.3 0.3 2

-- * random panning sines (jmcc) #4

rps :: UGen
rps =
    let nd = let o = fSinOsc AR (linRand 'α' 80 2000 0) 0
                 l = lfNoise1 'β' KR (rand 'γ' 0.8 1.2)
                 a = lfNoise1 'δ' KR (rand 'ε' 0.82 0.98)
             in pan2 o l a
    in mix (uclone 'ζ' 8 nd) * (0.4 / 8)

rps_ot :: IO ()
rps_ot = O.overlapTextureU (8,8,2,maxBound) rps

rps_m :: UId m => m UGen
rps_m = do
  let nd = do r0 <- linRandM 80 2000 0
              let o = fSinOsc AR r0 0
              l <- lfNoise1M KR =<< randM 0.8 1.2
              a <- lfNoise1M KR =<< randM 0.82 0.98
              return (pan2 o l a)
  r <- clone 8 nd
  return (mix r * (0.4 / 8))

-- * distort input (jmcc) #5

distort_input :: UGen
distort_input =
    let gain = mouseX KR 1 100 Exponential 0.2 {- gain into distortion -}
    in distort (soundIn (mce2 0 1) * gain) * 0.4

-- * ring modulate input (jmcc) #5

ring_modulate_input :: UGen
ring_modulate_input =
    let input = soundIn (mce2 0 1)
        x = mouseX KR 10 4000 Exponential 0.2 {- ring mod freq -}
        modulator = sinOsc AR x (mce2 0 (0.5 * pi)) {- offset phase of one osc by 90 degrees -}
    in input * modulator

-- * filter input (jmcc) #5

filter_input :: UGen
filter_input =
    let rQ = mouseY KR 0.01 1 Exponential 0.2 {- bandwidth ratio = 1/Q -}
        cf = mouseX KR 100 12000 Exponential 0.2 {- cutoff freq -}
        sg = soundIn (mce2 0 1) * 0.4 * sqrt rQ {- attenuate to offset resonance -}
    in rlpf sg cf rQ

-- * sweepy noise (jmcc) #6

sweepy_noise :: UGen
sweepy_noise =
    let n = uclone 'α' 2 (whiteNoise 'α' AR)
        lfoDepth = mouseY KR 200 8000 Exponential 0.1
        lfoRate = mouseX KR 4 60 Exponential 0.1
        freq = lfSaw KR lfoRate 0 * lfoDepth + (lfoDepth * 1.2)
        filtered = rlpf (n * 0.03) freq 0.1
    in combN filtered 0.3 0.3 2 + filtered

-- * string wander-cluster (jmcc) #6

type SWC_ST = (Double,R.StdGen)

swc_wander :: SWC_ST -> SWC_ST
swc_wander (n,g) =
    let (n',g') = R.randomR (-7,8) g
    in (foldToRange 50 120 (n + n'),g')

swc :: SWC_ST -> (UGen,SWC_ST)
swc st =
    let (n,g) = swc_wander st
        d = 1 / midiCPS (constant n)
        w = whiteNoise 'α' AR * 0.008
        o = combC w 0.01 d (d * 1000)
    in (pan2 o (rand 'β' (-1) 1) 1,(n,g))

swc_ot :: IO ()
swc_ot = O.overlapTextureS (4/3,4/3,6,maxBound) swc (60,R.mkStdGen 0)

swc' :: UGen
swc' =
    let n = rand 'α' 50 100
        n' = fold (n + rand 'β' 0 15 - 7) 50 120
        d = 1 / midiCPS n'
        w = whiteNoise 'γ' AR * 0.008
        o = combC w 0.01 d (d * 1000)
    in pan2 o (rand 'δ' (-1) 1) 1

swc_ot' :: IO ()
swc_ot' = O.overlapTextureU (4/3,4/3,6,maxBound) swc'

-- * comb delay sweeps (jmcc) #6

type CDS_ST = (Double,Double,R.StdGen)

cds_wander :: CDS_ST -> CDS_ST
cds_wander (s,e,g) =
    let (s',g') = R.randomR (-7,8) g
        (e',g'') = R.randomR (-7,8) g'
    in (foldToRange 50 120 (s + s')
       ,foldToRange 50 120 (e + e')
       ,g'')

cds :: CDS_ST -> (UGen,CDS_ST)
cds st =
    let (s,e,g) = cds_wander st
        l = line KR (constant s) (constant e) 4 DoNothing
        w = whiteNoise 'α' AR * 0.005
        d = 1 / midiCPS l
        c = 1 / midiCPS (constant s)
        o = combC w 0.01 d (c * 1000)
    in (pan2 o (rand 'β' (-1) 1) 1,(s,e,g))

cds_ot :: IO ()
cds_ot = O.overlapTextureS (4/3,4/3,9,maxBound) cds (60,61,R.mkStdGen 3567824)

cds' :: UGen
cds' =
    let s = fold (rand 'α' (- 7) 8) 50 120
        e = fold (rand 'β' (- 7) 8) 50 120
        l = line KR s e 4 DoNothing
        w = whiteNoise 'γ' AR * 0.005
        d = 1 / midiCPS l
        c = 1 / midiCPS s
        o = combC w 0.01 d (c * 1000)
    in pan2 o (rand 'δ' (-1) 1) 1

cds_ot' :: IO ()
cds_ot' = O.overlapTextureU (4/3,4/3,9,maxBound) cds'

-- * noise burst sweep (jmcc) #6

nbs_z :: ID a => a -> UGen
nbs_z e =
  let n = uclone e 2 (whiteNoise e AR)
      lfoRate = rand e (-1) 1 + mouseX KR 10 60 Exponential 0.2
      amp = max 0 (lfSaw KR lfoRate (-1))
      cfreq = mouseY KR 400 8000 Exponential 0.2
      freq = sinOsc KR 0.2 0 * cfreq + (1.05 * cfreq)
  in resonz (n * amp) freq 0.1

nbs :: UGen
nbs = nbs_z 'α'

nbs_ot :: IO ()
nbs_ot = O.overlapTextureU (4,2,4,maxBound) nbs

-- * saucer base (jmcc) #6

saucer_base :: UGen
saucer_base =
    let a = rand 'α' 0 20
        b = rand 'β' 0 1000
        c = rand 'γ' 0 5000
        p = rand 'δ' (-1) 1
        o = sinOsc AR a 0 * b + (1.1 * b)
        o' = sinOsc AR o 0 * c + (1.1 * c)
    in pan2 (sinOsc AR o' 0 * 0.1) p 1

saucer_base_ot :: IO ()
saucer_base_ot = O.overlapTextureU (2,6,4,maxBound) saucer_base

-- * alien meadow (jmcc) #6

alien_meadow :: UGen
alien_meadow =
    let b = rand 'α' 0 5000
        f = sinOsc AR (rand 'β' 0 20) 0 * b * 0.1 + b
    in pan2 (sinOsc AR f 0) (rand 'γ' (-1) 1) (sinOsc AR (rand 'δ' 0 20) 0 * 0.05 + 0.05)

alien_meadow_ot :: IO ()
alien_meadow_ot = O.overlapTextureU (2,6,6,maxBound) alien_meadow

-- * birdies (jmcc) #6

birdies :: UGen
birdies =
    let p1 = lfPulse KR (0.4 + rand 'α' 0 1) 0 (rand 'β' 0 0.8 + 0.1) * (rand 'γ' 0 3 + 4) + 2
        p2 = lfPulse KR (0.4 + rand 'δ' 0 1) 0 (rand 'ε' 0 0.8 + 0.1) * (rand 'ζ' 0 3 + 4)
        p3 = lfPulse KR (0.2 + rand 'η' 0 0.5) 0 0.4 * 0.02
        sw = lfSaw KR (p1 + p2) 0 * (- (1000 + rand 'θ' 0 800)) + (4000 + rand2 'ι' 1200)
        freq = lag sw 0.05
        amp = lag p3 0.3
    in pan2 (sinOsc AR freq 0 * amp) (rand2 'κ' 1) 1

birdies_ot :: IO ()
birdies_ot = O.overlapTextureU (7,4,4,maxBound) birdies

-- * phase modulation with slow beats (jmcc) #6

nrec :: (Num a, Ord a) => a -> (t -> t) -> t -> t
nrec n f st = if n > 0 then nrec (n - 1) f (f st) else st

pmwsb :: UGen
pmwsb =
    let x = mouseX KR 100 6000 Exponential 0.2 {- random freq of new events -}
        y = mouseY KR 0 2 Linear 0.2 {- modulation index -}
        o (e,a) = let f = rand e 0 x
                  in (succ e,fSinOsc AR (mce [f,f + rand2 'α' 1]) 0 * y + a)
        ph = snd (nrec (3::Int) o ('β',0))
        freq = rand 'γ' 0 x
    in sinOsc AR (mce [freq, freq + rand2 'δ' 1]) ph * 0.1

pmwsb_ot :: IO ()
pmwsb_ot = O.overlapTextureU (4,4,4,maxBound) pmwsb

-- * hard sync sawtooth with lfo (jmcc) #6

hsswl :: UGen
hsswl =
    let f = midiCPS (30 + iRand 'α' 0 50)
        o = sinOsc KR 0.2 (mce [0, rand 'β' 0 (2 * pi)]) * (2 * f) + (3 * f)
    in syncSaw AR (mce [f, f + 0.2]) o * 0.05

hsswl_pp :: UGen -> UGen
hsswl_pp z = combN z 0.3 0.3 4 + mceReverse z

hsswl_ot :: IO ()
hsswl_ot = O.overlapTextureU_pp (4,4,4,maxBound) hsswl 2 hsswl_pp

-- * noise modulated sines (jmcc) #6

nms :: UGen
nms =
    let f = midiCPS (rand 'α' 60 100)
        o = fSinOsc AR (mce2 f (f + 0.2)) 0
        a = lfNoise2 'β' KR (f * mce2 0.15 0.16) * 0.1
    in o * a

nms_pp :: (UGen -> UGen)
nms_pp i = combN i 0.3 0.3 4 + mceReverse i

nms_ot :: IO ()
nms_ot = O.overlapTextureU_pp (4,4,4,maxBound) nms 2 nms_pp

-- * noise modulated sawtooths (jmcc) #6

nmsw :: UGen
nmsw =
    let f = midiCPS (rand 'α' 60 100)
        o = lfSaw AR (mce2 f (f + 0.2)) 0
        a = lfNoise2 'β' KR (f * mce2 0.15 0.16) * 0.1
    in o * a

nmsw_pp :: (UGen -> UGen)
nmsw_pp i = combN i 0.3 0.3 4 + mceReverse i

nmsw_ot :: IO ()
nmsw_ot = O.overlapTextureU_pp (4,4,4,maxBound) nmsw 2 nmsw_pp

-- * aleatoric quartet (jmcc) #7

aleatoric_quartet_m :: UId m => m UGen
aleatoric_quartet_m = do
  let base_mn = 66 -- control KR "note" 66
      amp = 0.07 -- control KR "ampl" 0.07
      density = mouseX KR 0.01 1 Linear 0.1
      dmul = recip density * 0.5 * amp
      dadd = amp - dmul
      rapf i = do r <- clone 2 (randM 0 0.05)
                  return (allpassN i 0.05 r 1)
      mk_f = do r0 <- lchooseM [1, 0.5, 0.25]
                r1 <- randM (-30) 30
                n0 <- lfNoise0M KR r0
                let m = n0 * 7 + base_mn + r1
                    m' = lag (roundTo m 1) 0.2
                return (midiCPS m')
      mk_s = do f <- fmap recip mk_f
                r <- randM (-1) 1
                x <- do n0 <- pinkNoiseM AR
                        n1 <- lfNoise1M KR 8
                        return (n0 * max 0 (n1 * dmul + dadd))
                return (pan2 (combL x 0.02 f 3) r 1)
  g <- chainM 5 rapf =<< fmap sum (sequence (replicate 4 mk_s))
  return (leakDC g 0.995)

aleatoric_quartet :: UGen
aleatoric_quartet = uid_st_eval aleatoric_quartet_m

-- * slow beating sines (jmcc) #7

{-
> MR.evalRand (sbs_r_param 20 0.4 3) (R.mkStdGen 121423)
-}

type SBS_PARAM n = (([[n]], [[n]], [[n]]), ([[n]], [[n]], [[n]]))

sbs_r_param :: R.RandomGen g => Int -> Double -> Int -> MR.Rand g (SBS_PARAM Double)
sbs_r_param n d m = do
  let gen_hm k f = MR.nrrand k (f - d) (f + d)
      gen_hm' k f = fmap (f :) (gen_hm k f)
      gen_ph = MR.nrrand m 0 (2 * pi)
  f <- MR.nrrand n (midi_to_cps 24) (midi_to_cps 84)
  p_fr <- mapM (gen_hm' (m - 1)) f
  q_fr <- mapM (gen_hm m) f
  p_ph <- replicateM n gen_ph
  q_ph <- replicateM n gen_ph
  let a = replicate n (replicate m 1)
  return ((p_fr,a,p_ph),(q_fr,a,q_ph))

sbs_r :: R.RandomGen g => Int -> Double -> Int -> MR.Rand g UGen
sbs_r n d m = do
  ((p_fr,p_am,p_ph),(q_fr,q_am,q_ph)) <- sbs_r_param n d m
  let p_sp = zipWith3 klangSpec' p_fr p_am p_ph
      q_sp = zipWith3 klangSpec' q_fr q_am q_ph
      mk_u s = klang AR 1 0 s * (0.1 / fromIntegral n)
      p_u = sum (map mk_u p_sp)
      q_u = sum (map mk_u q_sp)
  return (mce2 p_u q_u)

sbs_ot :: IO ()
sbs_ot = do
  g <- R.getStdGen
  O.overlapTextureS (4,4,3,maxBound) (MR.runRand (sbs_r 20 0.4 3)) g

sbs :: UGen
sbs = MR.evalRand (sbs_r 20 0.4 3) (R.mkStdGen 123678141)

-- * slow beating harmonic sines (jmcc) #7

sbhs_r_freq :: R.RandomGen g => Int -> Int -> MR.Rand g [Double]
sbhs_r_freq k i = do
  n <- MR.nchoose i [0,2,4,5,7,9]
  o <- MR.nrand i 7
  let f n' o' = midi_to_cps (n' + (o' * 12) + fromIntegral k)
  return (zipWith f n o)

sbhs_r_harmonics :: R.RandomGen g => Double -> Int -> Double -> MR.Rand g [Double]
sbhs_r_harmonics d m f = do
  d' <- MR.nrand2 m d
  return (zipWith (+) (map (* f) [1,2,4,5,6]) d')

type SBHS_PARAM n = (([[n]], [[n]], [[n]]), ([[n]], [[n]], [[n]]))

sbhs_r_param :: R.RandomGen g => Int -> Double -> Int -> MR.Rand g (SBS_PARAM Double)
sbhs_r_param n d m = do
  k' <- MR.rand 12
  let k = 24 + k'
      gen_ph = MR.nrrand m 0 (2 * pi)
  f <- sbhs_r_freq k n
  p_fr <- mapM (sbhs_r_harmonics d m) f
  q_fr <- mapM (sbhs_r_harmonics d m) f
  p_ph <- replicateM n gen_ph
  q_ph <- replicateM n gen_ph
  let a = replicate n (replicate m 1)
  return ((p_fr,a,p_ph),(q_fr,a,q_ph))

sbhs_r :: R.RandomGen g => Int -> Double -> Int -> MR.Rand g UGen
sbhs_r n d m = do
  ((p_fr,p_am,p_ph),(q_fr,q_am,q_ph)) <- sbhs_r_param n d m
  let p_sp = zipWith3 klangSpec' p_fr p_am p_ph
      q_sp = zipWith3 klangSpec' q_fr q_am q_ph
      mk_u s = klang AR 1 0 s * (0.1 / fromIntegral n)
      p_u = sum (map mk_u p_sp)
      q_u = sum (map mk_u q_sp)
  return (mce2 p_u q_u)

sbhs_ot :: IO ()
sbhs_ot = do
  g <- R.getStdGen
  O.overlapTextureS (3,6,3,maxBound) (MR.runRand (sbhs_r 8 0.4 5)) g

sbhs :: UGen
sbhs = MR.evalRand (sbs_r 8 0.4 5) (R.mkStdGen 123678141)

-- * tapping tools (jmcc) #7

tapping_tools :: UGen
tapping_tools =
    let e = envLinen 1 4 1 1
        rate = xLine KR 64 0.125 60 DoNothing
        exc = decay (impulse AR (linRand 'α' 1 21 0 * rate) 0 * 0.03) 0.001
        r0 = RDU.randN 4 'β' 400 8400
        r1 = RDU.randN 4 'γ' 0.01 0.11
        spc = klankSpec_mce r0 (mce [1,1,1,1]) r1
        flt = klank exc 1 0 1 spc
    in pan2 flt (rand 'δ' (-1) 1) (envGen KR 1 1 0 1 RemoveSynth e)

tapping_tools_pp :: UGen -> UGen
tapping_tools_pp z =
    let f x = allpassN x 0.05 (mce2 (rand 'ε' 0 0.05) (rand 'ζ' 0 0.05)) 2
    in useq 'η' 3 f z

tapping_tools_ot :: IO ()
tapping_tools_ot = O.overlapTextureU_pp (2,1,3,maxBound) tapping_tools 2 tapping_tools_pp

-- * modal space, using local buffer (jmcc) #8

ms1 :: UGen -> UGen -> UGen
ms1 n r =
    let b = asLocalBuf 'α' [0,2,3.2,5,7,9,10] {- dorian scale -}
        x = mouseX KR 0 15 Linear 0.1 {- mouse indexes into scale -}
        k = degreeToKey b x 12 {- 12 notes per octave -}
        o = sinOsc AR (midiCPS (r + k + n * 0.04)) 0 * 0.1
        t = lfPulse AR (midiCPS (mce2 48 55)) 0 0.15
        f = midiCPS (sinOsc KR 0.1 0 * 10 + r)
        d = rlpf t f 0.1 * 0.1
        m = o + d
    in combN m 0.31 0.31 2 + m

modal_space :: UGen
modal_space = (ms1 (lfNoise1 'β' KR 3) 48 + ms1 (lfNoise1 'γ' KR 3) 72) * 0.25

-- * landon rose (jmcc) #8

lr_nt :: Num n => [[n]]
lr_nt =
    [[32,43,54, 89]
    ,[10,34,80,120]
    ,[67,88,90,100]
    ,[76,88,99,124]]

lr_fr :: Floating n => [[n]]
lr_fr = map (map midi_to_cps) lr_nt

lr_nd :: ID a => a -> UGen -> [UGen] -> UGen
lr_nd z e f =
    let p = klankSpec f (replicate 4 1) (replicate 4 3)
        x = e * pinkNoise z AR * mce2 0.0011 0.0012
    in klank x 1 0 1 p

lr_env :: Real n => n -> UGen
lr_env i = abs (sinOsc AR (1 / 8) ((constant i / 2) * pi))

landon_rose :: UGen
landon_rose = sum (zipWith3 lr_nd "αβγδ" (map lr_env [0::Int .. 3]) lr_fr)

-- * deep trip (jmcc) #9

deep_trip :: UGen
deep_trip =
    let f = midiCPS (lfNoise1 'α' KR (rand 'β' 0 0.3) * 60 + 70)
        a'' = sinOsc KR (rand 'γ' 0 40) 0 * 0.1
        a' = max 0 (lfNoise1 'δ' KR (rand 'ε' 0 8) * a'')
        a = lfNoise2 'ζ' AR (f * rand 'η' 0 0.5) * a'
        z = sinOsc AR f 0 * a
        s = pan2 z (lfNoise1 'θ' KR (rand 'ι' 0 5)) 1
        c0 = combN s 0.5 (RDU.randN 2 'κ' 0.3 0.5) 20
        c1 = combN s 0.5 (RDU.randN 2 'λ' 0.3 0.5) 20
        in s + c0 + c1

deep_trip_ot :: IO ()
deep_trip_ot = O.overlapTextureU (4,12,4,maxBound) deep_trip

-- * sawed cymbals (jmcc) #9

sawed_cymbals :: UGen
sawed_cymbals =
    let y = let f1 = rand 'α' 500 2500
                f2 = rand 'α' 0 8000
                f = uclone_seq 'α' 15 (rand 'α' f1 (f1 + f2))
                rt = uclone_seq 'α' 15 (rand 'α' 2 6)
          in klankSpec f (replicate 15 1) rt
        z = uclone 'α' 2 y
        fS = xLine KR (rand 'α' 0 600) (rand 'β' 0 600) 12 DoNothing
    in klank (lfSaw AR fS 0 * 0.0005) 1 0 1 (mceTranspose z)

sawed_cymbals_ot :: IO ()
sawed_cymbals_ot = O.overlapTextureU (4,4,6,maxBound) sawed_cymbals

-- * sidereal time (jmcc) #9

sidereal_time :: UGen
sidereal_time =
  let p = 15
      z = let y = let fr = uclone_seq 'α' p (expRand 'β' 100 6000)
                      rt = uclone_seq 'γ' p (rand 'δ' 2 6)
                  in klankSpec fr (replicate p 1) rt
          in uclone 'ε' 2 y
      f = xLine KR (expRand 'ζ' 40 300) (expRand 'η' 40 300) 12 DoNothing
      t = let e = lfNoise2 'θ' KR (rand 'ι' 0 8)
          in lfPulse AR f 0 (rand 'κ' 0.1 0.9) * 0.002 * max 0 e
      o = distort (klank t 1 0 1 (mceTranspose z)) * 0.1
  in combN o 0.6 (rand 'λ' 0.1 0.6) 8 + mceReverse o

sidereal_time_ot :: IO ()
sidereal_time_ot = O.overlapTextureU (4,4,6,maxBound) sidereal_time

-- * contamination zone (jmcc) #9

cz :: UGen
cz =
    let f = expRand 'α' 800 8000
        p = let e = lfNoise1 'β' KR (rand 'γ' 0 3) * 0.0008 + 0.0022
            in pinkNoise 'δ' AR * e
        s = sinOsc KR (linRand 'ε' 0 1 0) 0 * (0.7 * f) + f
        k = let sp = klankSpec_mce (RDU.randN 4 'ζ' 50 2000)
                                   (mce [1,1,1,1])
                                   (RDU.randN 4 'η' 0.2 4)
            in abs (klank p 1 0 1 sp) * choose 'θ' (mce2 (-1) 1)
        r = rlpf k s 0.1
        a = lfPulse KR (linRand 'ι' 0 150 0) 0 (rand 'κ' 0.2 0.4)
    in pan2 r (lfNoise1 'λ' KR (rand 'μ' 0 1)) a

cz_pp :: UGen -> UGen
cz_pp =
    let f x = allpassN x 0.04 (RDU.randN 2 'ν' 0 0.04) 16
    in useq 'ξ' 6 f

cz_ot :: IO ()
cz_ot = O.overlapTextureU_pp (3,8,4,maxBound) cz 2 cz_pp

-- * choip (jmcc) #10

choip :: UGen
choip =
    let xl e0 e1 n0 n1 tm = xLine KR (expRand e0 n0 n1) (expRand e1 n0 n1) tm DoNothing
        t = 12
        i = impulse AR (xl 'α' 'β' 1 30 t) 0
        f = xl 'γ' 'δ' 600 8000 t
        a = sinOsc AR (decay2 i 0.05 0.5 * (-0.9) * f + f) 0
        l = line KR (rand2 'ε' 1) (rand2 'ζ' 1) t DoNothing
    in pan2 (decay2 (i * xl 'η' 'θ' 0.01 0.5 t) 0.01 0.2 * a) l 1

choip_pp :: UGen -> UGen
choip_pp =
    let f x = allpassN x 0.1 (RDU.randN 2 'ι' 0 0.05) 4
    in useq 'κ' 4 f

choip_ot :: IO ()
choip_ot = O.overlapTextureU_pp (10,1,8,maxBound) choip 2 choip_pp

-- * strummable guitar (jmcc) #11

str_gtr_str :: UGen -> Int -> UGen
str_gtr_str sc ix' =
    let ix = constant ix'
        x = mouseX KR 0 1 Linear 0.2
        t = abs (hpz1 (x >* (0.25 + ix * 0.1)))
        e = decay t 0.05
        n = pinkNoise ix' AR * e
        dt = 1 / midiCPS sc
        s = combL n dt dt 4
    in pan2 s (ix * 0.2 - 0.5) 1

str_gtr :: UGen
str_gtr =
    let scale = [52,57,62,67,71,76]
        strs = sum (zipWith str_gtr_str scale [0..])
    in leakDC (lpf strs 12000) 0.995

-- * drone plus rhythm (jmcc) #12

dpr_scale :: Num a => [a]
dpr_scale = [0, 2, 3, 5, 7, 9, 10]

dpr_drone_1 :: UGen
dpr_drone_1 =
    let f0 = midiCPS (lchoose 'α' [24,36] + rand2 'β' 0.08)
        f1 = lfSaw AR (mce2 f0 (f0 + 0.2)) 0 * lfNoise2 'γ' KR (f0 * mce2 0.05 0.04) * 0.06
    in lpf f1 (rand 'δ' 1000 3000)

dpr_drone_2 :: UGen
dpr_drone_2 =
    let x = rand 'ε' 0 1 >* 0.8
        m = lchoose 'ζ' [60,72] + lchoose 'η' dpr_scale + uclone 'θ' 2 (rand2 'ι' 0.05)
    in sinOsc AR (midiCPS m) 0 * x * rand 'κ' 0.04 0.07

dpr_rhy :: UGen
dpr_rhy =
    let m = lchoose 'λ' [48, 60, 72, 84] + lchoose 'μ' dpr_scale + uclone 'ν' 2 (rand2 'ξ' 0.03)
        sq = isequX 'ο' [0,1,0,1,1,0] (impulse AR (lchoose 'π' [1.5,3,6]) 0)
        sg = lfPulse AR (midiCPS m) 0 0.4 * rand 'ρ' 0.03 0.08
    in rlpf (decay2 sq 0.004 (rand 'σ' 0.2 0.7) * sg) (expRand 'τ' 800 2000) 0.1

dpr_rhy_pp :: UGen -> UGen
dpr_rhy_pp z = combN z 0.5 0.5 6 + mceReverse z

dpr_ot :: IO [ThreadId]
dpr_ot = do
  t1 <- forkIO (O.overlapTextureU_pp (6,6,6,maxBound) dpr_rhy 2 dpr_rhy_pp)
  t2 <- forkIO (O.overlapTextureU (4,4,8,maxBound) dpr_drone_1)
  t3 <- forkIO (O.overlapTextureU (4,6,3,maxBound) dpr_drone_2)
  return [t1,t2,t3]

dpr_ot_ :: IO ()
dpr_ot_ = dpr_ot >> return ()

-- * early space music LP, side 2 (jmcc) #12

esmlp2_m1 :: UGen
esmlp2_m1 =
    let a = rand 'α' 0 20
        b = rand 'β' 0 5000
        c = rand 'γ' 0 20
        p = rand 'δ' (-1) 1
    in pan2 (sinOsc AR (sinOsc AR a 0 * 0.1 * b + b) 0 * sinOsc KR c 0 * 0.08 + 0.08) p 1

esmlp2_m2 :: UGen
esmlp2_m2 =
    let a0 = rand 'ε' 40 240
        a1 = a0 + rand 'ζ' (-1) 1
        a = mce2 a0 a1
        b = expRand 'η' 50 2400
        c = mce2 (a0 + rand 'θ' (-1) 1) (a1 + rand 'ι' (-1) 1)
    in sinOsc AR (sinOsc AR a 0 * rand 'κ' 0 1 * b + b) 0 * sinOsc KR c 0 * 0.025 + 0.025

esmlp2_m3 :: UGen
esmlp2_m3 =
    let f = midiCPS (rand 'λ' 60 100)
    in fSinOsc AR (mce2 f (f + 0.2)) 0 * lfNoise2 'μ' KR (f * mce2 0.15 0.16) * 0.1

id_seq :: Enum a => a -> Int -> [Int]
id_seq c n = let c' = fromEnum c in [c' .. c' + n - 1]

esmlp2_m4 :: UGen
esmlp2_m4 =
    let a = lfPulse KR (expRand 'ν' 0.2 1.2) 0 (rand 'ξ' 0.1 0.2)
        o z = let i = constant z
                  r = let (p,q) = mce2c (RDU.expRandN 2 z 0.1 20)
                      in xLine KR p q 25.6 DoNothing
                  f = midiCPS (rand z 24 96)
                  e = max 0 (sinOsc KR (r * rand z 0.9 1.1) (rand z 0 (2 * pi)) * 0.1 - 0.05)
                  s = fSinOsc AR (f * i + f) 0 * e * (1 / (i + 1))
              in pan2 s (rand z (-1) 1) 1
    in sum (map o (id_seq (0::Int) 12)) * a

esmlp2_m6 :: UGen
esmlp2_m6 =
    let f = midiCPS (lfNoise1 'π' KR (rand 'ρ' 0 0.3) * 60 + 70)
        a0 = lfNoise2 'σ' AR (f * rand 'τ' 0 0.5)
        a1 = max 0 (lfNoise1 'υ' KR (rand 'φ' 0 8) * sinOsc KR (rand 'χ' 0 40) 0 * 0.1)
        z = sinOsc AR f 0 * a0 * a1
    in pan2 z (lfNoise1 'ψ' KR (rand 'ω' 0 5)) 1

esmlp2_m7 :: UGen
esmlp2_m7 =
    let p = 15
        k = let y z = let fr = mceChannels (RDU.expRandN p z 100 6000)
                          rt = mceChannels (RDU.randN p z 2 6)
                      in klankSpec fr (replicate p 1) rt
            in mce2 (y 'Α') (y 'Β')
        f = xLine KR (expRand 'Γ' 40 300) (expRand 'Δ' 40 300) 12 DoNothing
        t = lfPulse AR f 0 (rand 'Ε' 0.1 0.9) * 0.002 * max 0 (lfNoise2 'Ζ' KR (rand 'Η' 0 8))
    in distort (klank t 1 0 1 (mceTranspose k)) * 0.3

esmlp2 :: R.RandomGen g => g -> (UGen, g)
esmlp2 = R.Gen.choose (map (* 0.3) [esmlp2_m1,esmlp2_m2,esmlp2_m3,esmlp2_m4,esmlp2_m6,esmlp2_m7])

esmlp2_pp :: UGen -> UGen
esmlp2_pp i =
    let c z = combN i 0.3 (mce2 (rand z 0.1 0.3) (rand z 0.12 0.32)) 8
    in sum (map c (id_seq 'Θ' 5)) * 0.3

esmlp2_ot :: IO ()
esmlp2_ot = do
  let g = R.mkStdGen 0
  O.overlapTextureS_pp (4,2,6,maxBound) esmlp2 g 2 esmlp2_pp

-- * blips 001 (jmcc) #SC3d1.5

blip_001 :: ID a => a -> UGen
blip_001 e =
    let f = xLine KR (expRand 'α' 0.25 400) (expRand 'β' 0.25 400) 4 DoNothing
        nh = xLine KR (expRand 'γ' 2 100) (expRand 'δ' 2 100) 4 DoNothing
    in uprotect e (blip AR f nh)

blips_001 :: UGen
blips_001 =
    let c = rand 'ε' 0 1 SC3.<* 0.8
        o = blip_001 'ζ' * blip_001 'η'
    in (c * pan2 o (line KR (rand2 'θ' 1) (rand2 'ι' 1) 4 DoNothing) 0.3)

blips_001_pp :: UGen -> UGen
blips_001_pp z =
    let z' = distort z
        f x = allpassN x 0.05 (mce2 (rand 'κ' 0 0.05) (rand 'λ' 0 0.05)) 4
    in useq 'μ' 6 f z'

blips_001_ot :: IO ()
blips_001_ot = O.overlapTextureU_pp (2,1,12,maxBound) blips_001 2 blips_001_pp

-- * zizle (jmcc) #SC3d1.5

zizle :: UGen
zizle =
  let a e f = let fm = mce2 (rand 'α' 0.7 1.3) 1
                  ph = mce2 (rand 'β' 0 two_pi) (rand 'γ' 0 two_pi)
              in uprotect e (mix (sinOsc AR (f * fm) ph * 0.1))
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
      x = uclone 'γ' 2 (b 14 400 500 0.006)
      y = uclone 'δ' 2 (b 20 800 1000 0.010)
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
      f = demand tr 0 (mce [midiCPS (s1 - 12), midiCPS s3])
      o1 = sinOsc AR (f + mce2 0 0.7) 0
      o2 = saw AR (f + mce2 0 0.7) * 0.3
      o3 = cubed (distort (log (distort (o1 + o2))))
  in o3 * 0.1

-- * impulse sequencer (jmcc) SC2

impulse_sequencer :: UGen
impulse_sequencer =
    let t = impulse AR 8 0 {- single sample impulse as trigger -}
        c_sq = dsequ 'α' [1,0,0,1,0,0,1,0,0,0,1,0,1,0,0,0] t * t {- clave rhythm -}
        c = decay2 c_sq 0.001 0.3 * fSinOsc AR 1700 0 * 0.1
        d_sq = dsequ 'β' [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,0,0,0] t * t
        d = decay2 d_sq 0.001 0.3 * fSinOsc AR 2400 0 * 0.04
        n_sq = dsequ 'γ' [1.0, 0.1, 0.1, 1.0, 0.1, 1.0, 0.1, 0.1] t * t {- noise drum -}
        n = decay2 n_sq 0.001 0.25 * brownNoise 'δ' AR * 0.1
        b_sq = dsequ 'ε' [1,0,0.2,0,0.2,0,0.2,0] t * t {- bass drum -}
        b = decay2 b_sq 0.001 0.5 * fSinOsc AR 100 0 * 0.2
    in c + d + n + b

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

{- > let u = useq 'λ' 4 r_allpass (soundIn 0) -}
r_allpass :: UGen -> UGen
r_allpass i = allpassN i 0.03 (RDU.randN 2 'ζ' 0.005 0.02) 1

{- <http://create.ucsb.edu/pipermail/sc-users/2004-April/009692.html> -}
tank :: UGen
tank =
  let s = tank_bang + mix (uclone 'κ' 8 tank_pling)
  in tank_f (useq 'λ' 4 r_allpass s)

tank_rev :: UGen -> UGen
tank_rev = tank_f . useq 'λ' 4 r_allpass

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

birds_node :: UGen
birds_node =
  let swt = lfSaw AR (7 + rand2 'α' 1.5) (rand 'β' 0 1) * rand 'γ' 11 15
      mnn = lag swt 0.1 + rand 'δ' 94 102
      a = lfPulse KR (1 / rand 'ε' 12 15.6) (rand 'ζ' 0 1) 0.16 * 0.05
      b = sinOsc AR (midiCPS mnn) (rand 'η' 0 1) * a
  in rotate2 b (silent 1) (rand 'θ' (-1) 1)

birds :: UGen
birds =
  let d = mix (uclone 'α' 6 birds_node)
      f i = allpassL i 0.07 (rand 'β' 0 0.06) (rand 'γ' 0.7 2.0)
      w = useq 'δ' 12 f d
  in d * 0.7 + w * 0.3

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

-- * TABLE

jmcc_sc2 :: [[(String,Maybe UGen,Maybe (IO ()))]]
jmcc_sc2 =
    -- SC2
    [[("why supercollider",Just why_supercollider,Nothing)]
    ,[("analog bubbles",Just analog_bubbles,Nothing)
     ,("lfo modulation",Just lfo_modulation,Nothing)
     ,("hell is busy",Just hib,Just hib_ot)
     ,("pond life",Just pond_life,Just pond_life_ot)
     ,("alien froggies",Just alien_froggies_11,Just alien_froggies_ot)
     ,("random sine waves",Just rsw,Just rsw_ot)
     ,("random pulsations",Just rp,Just rp_st)
     ,("moto rev",Just moto_rev,Nothing)
     ,("scratchy",Just scratchy,Nothing)
     ,("tremulate",Just tremulate,Just tremulate_xt)
     ,("reso pulse",Just reso_pulse,Just reso_pulse_ot)
     ,("sprinkler",Just sprinkler,Nothing)
     ,("sprinkler mouse",Just sprinkler_mouse,Nothing)
     ,("harmonic swimming",Just harmonic_swimming,Nothing)
     ,("harmonic tumbling",Just harmonic_tumbling,Nothing)]
    ,[("rails",Just rails,Just rails_ot)
     ,("bouncing objects",Just bouncing_objects,Just bouncing_objects_st)
     ,("lots-o-sines",Just lots_o_sins,Just lots_o_sins_xt)
     ,("clustered sines",Just cs,Just cs_xt)
     ,("resonators harmonic series",Just rhs,Just rhs_xt)
     ,("swept resonant noise",Just srn,Just srn_ot)
     ,("coolant",Just coolant,Just coolant_ot)
     ,("pulsing bottles",Just pulsing_bottles,Just pulsing_bottles_ot)
     ,("what was i thinking",Just what_was_i_thinking,Nothing)
     ,("narrow band filtered crackle noise",Just nbfcn,Just nbfcn_st)
     ,("resonant dust",Just resonant_dust,Just resonant_dust_ot)
     ,("police state",Just police_state,Nothing)
     ,("uplink",Just uplink,Just uplink_ot)
     ,("data space",Just data_space,Just data_space_ot)
     ,("cymbalism",Just cymbalism,Just cymbalism_ot)
     ,("cymbalism accelerando",Just cymbalism_accellerando,Just cymbalism_accellerando_ot)
     ,("ring modulated klank",Just rmk,Just rmk_ot)]
    ,[("analogue daze",Just analogue_daze,Nothing)
     ,("synthetic piano",Just synthetic_piano,Just synthetic_piano_ot)
     ,("reverberated sine percussion",Just reverberated_sine_percussion,Nothing)
     ,("reverberated noise bursts",Just rnb,Nothing)
     ,("analog bubbles mouse",Just analog_bubbles_mouse,Nothing)]
    ,[("berlin 1977",Just berlin_1977,Nothing)
     ,("metal plate",Just metal_plate,Nothing)
     ,("sample and hold liquidities",Just sample_and_hold_liquidities,Nothing)
     ,("random panning sines",Just rps,Just rps_ot)]
    ,[("distort input",Just distort_input,Nothing)
     ,("ring modulate input",Just ring_modulate_input,Nothing)
     ,("filter input",Just filter_input,Nothing)]
    ,[("sweepy noise",Just sweepy_noise,Nothing)
     ,("string wander-cluster",Just swc',Just swc_ot)
     ,("comb delay sweeps",Just cds',Just cds_ot)
     ,("noise burst sweep",Just nbs,Just nbs_ot)
     ,("saucer base",Just saucer_base,Just saucer_base_ot)
     ,("alien meadow",Just alien_meadow,Just alien_meadow_ot)
     ,("birdies",Just birdies,Just birdies_ot)
     ,("phase modulation",Just pmwsb,Just pmwsb_ot)
     ,("hard sync sawtooth with lfo",Just hsswl,Just hsswl_ot)
     ,("noise modulated sines",Just nms,Just nms_ot)
     ,("noise modulated sawtooths",Just nmsw,Just nmsw_ot)]
    ,[("aleatoric quartet",Just aleatoric_quartet,Nothing)
     ,("slow beating sines",Just sbs,Just sbs_ot)
     ,("slow beating harmonic sines",Just sbhs,Just sbhs_ot)
     ,("tapping tools",Just tapping_tools,Just tapping_tools_ot)]
    ,[("modal space",Just modal_space,Nothing)
     ,("landon rose",Just landon_rose,Nothing)]
    ,[("deep trip",Just deep_trip,Just deep_trip_ot)
     ,("sawed cymbals",Just sawed_cymbals,Just sawed_cymbals_ot)
     ,("sidereal time",Just sidereal_time,Just sidereal_time_ot)
     ,("contamination zone",Just cz,Just cz_ot)]
    ,[]
    ,[("strummable guitar",Just str_gtr,Nothing)
     ,("drone plus rhythm",Nothing,Just dpr_ot_)
     ,("early space music lp side one",Nothing,Nothing)
     ,("early space music lp side two",Nothing,Just esmlp2_ot)]
    -- SC3d1.5
    ,[("blips 001",Just blips_001,Just blips_001_ot)
     ,("zizle",Just zizle,Just zizle_ot)]
    -- SC3
    ,[("babbling brook",Just babbling_brook,Nothing)]
    ,[("mridangam",Nothing,Just mri_run)]]
