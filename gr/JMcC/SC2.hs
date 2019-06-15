module JMcC.SC2 where

import Control.Concurrent {- base -}
import Control.Monad {- base -}
import Data.List {- base -}

import qualified System.Random as R {- random -}

import qualified Control.Monad.Random as MR {- MonadRandom -}

import Sound.SC3 as SC3 {- hsc3 -}

import qualified Sound.SC3.UGen.Protect as Protect {- hsc3-rw -}

import qualified Sound.SC3.Lang.Collection as C {- hsc3-lang -}
import qualified Sound.SC3.Lang.Control.OverlapTexture as O {- hsc3-lang -}
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

-- * SC2-1

-- | analog bubbles (jmcc) #1
analog_bubbles :: UGen
analog_bubbles =
  let o = lfSaw KR (mce2 8 7.23) 0 * 3 + 80
      f = lfSaw KR 0.4 0 * 24 + o
      s = sinOsc AR (midiCPS f) 0 * 0.04
  in combN s 0.2 0.2 4

{-

> putStrLn $ synthstat analog_bubbles
> let g = synthdef_to_graphdef (synthdef "analog-bubbles" (out 0 analog_bubbles))
> import qualified Sound.SC3.Server.Graphdef as Graphdef
> putStrLn $ Graphdef.graphdef_stat g

-}

-- | lfo modulation (jmcc) #1
lfo_modulation :: UGen
lfo_modulation =
  let o = fSinOsc KR 0.05 0 * 80 + 160
      p = fSinOsc KR (mce2 0.6 0.7) 0 * 3600 + 4000
      s = rlpf (lfPulse AR o 0 0.4 * 0.05) p 0.2
  in combL s 0.3 (mce2 0.2 0.25) 2

-- | hell is busy (jmcc) #1
hell_is_busy :: UGen
hell_is_busy =
    let o = fSinOsc AR (400 + rand 'α' 0 2000) 0
        a = lfPulse KR (1 + rand 'β' 0 10.0) 0 (rand 'γ' 0 0.7) * 0.04
    in pan2 (o * a) (rand 'δ' (-1) 1) 1

hell_is_busy_ot :: IO ()
hell_is_busy_ot = O.overlapTextureU (4,4,8,maxBound) hell_is_busy

-- | pond life (jmcc) #1
pond_life :: UGen
pond_life =
    let f0 = 20 + rand 'α' 0 30
        f1 = fSinOsc KR f0 0 * rand 'β' 100 400 + linRand 'γ' 500 2500 0
        a = lfPulse KR (3 / rand 'δ' 1 9) 0 (rand 'ε' 0.2 0.5) * 0.04
    in pan2 (sinOsc AR f1 0 * a) (rand 'ζ' (-1) 1) 0.5

pond_life_ot :: IO ()
pond_life_ot = O.overlapTextureU (8,8,4,maxBound) pond_life

-- | alien froggies (jmcc) #1
alien_froggies :: UGen -> UGen
alien_froggies r =
    let r' = fold (r * exp (linRand 'α' (-0.2) 0.2 0)) 1 30
        o = formant AR r' (expRand 'β' 200 3000) (rand 'γ' 0 9 * r' + r')
    in o * 0.05

alien_froggies_11 :: UGen
alien_froggies_11 = alien_froggies 11

alien_froggies_ot :: IO ()
alien_froggies_ot = O.overlapTextureU (0.25,0.5,5,maxBound) alien_froggies_11

-- | random sine waves (jmcc) #1
random_sine_waves :: UGen
random_sine_waves =
    let f = rand 'α' 0 2000
        o = fSinOsc AR f 0 * 0.02
    in pan2 o (rand 'β' (-1) 1) 1

random_sine_waves_ot :: IO ()
random_sine_waves_ot = O.overlapTextureU (2,5,12,maxBound) random_sine_waves

-- * random pulsations (jmcc) #1
random_pulsations :: UGen
random_pulsations =
    let e = envLinen 2 5 2 0.02
        o1 = fSinOsc AR (rand 'α' 0 2000) 0 * envGen KR 1 1 0 1 DoNothing e
        o2 = sinOsc AR (linRand 'β' 8 88 0) 0
        o3 = sinOsc KR (rand 'γ' 0.3 0.8) (rand 'δ' 0 (2 * pi)) * 0.7
    in pan2 (o1 `amClip` o2) o3 1

random_pulsations_st :: IO ()
random_pulsations_st = O.spawnTextureU (const (9/8),maxBound) random_pulsations

-- | moto rev (jmcc) #1
moto_rev :: UGen
moto_rev =
  let f = sinOsc KR 0.2 0 * 10 + 21
      s = lfPulse AR f (mce2 0 0.1) 0.1
  in clip2 (rlpf s 100 0.1) 0.4

-- | scratchy (jmcc) #1
scratchy :: UGen
scratchy =
  let n = mce (map (\z -> brownNoise z AR * 0.5 - 0.49) (id_seq 2 'α'))
  in rhpf (max n 0 * 20) 5000 1

-- | tremulate (jmcc) #1
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

-- | reso-pulse (jmcc) #1
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

-- | sprinkler (jmcc) #1
sprinkler :: UGen
sprinkler =
  let f = lfPulse KR 0.09 0 0.16 * 10 + 7
      t = lfPulse KR f 0 0.25 * 0.1
      n = whiteNoise 'α' AR
  in bpz2 (n * t)

-- | sprinkler mouse (jmcc) #1
sprinkler_mouse :: UGen
sprinkler_mouse =
    let n = whiteNoise 'α' AR
        f = mouseX KR 0.2 50 Linear 0.2
        t = lfPulse KR f 0 0.25 * 0.1
    in bpz2 (n * t)

-- | harmonic swimming (jmcc) #1
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

-- | harmonic tumbling (jmcc) #1
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

-- * SC2-2

-- | rails (jmcc) #2
rails :: UGen
rails =
    let n = 20 {- resonant modes -}
        e = dust 'α' AR 100 * 0.04 {- excitation -}
        f = xLine KR 3000 300 8 DoNothing {- sweep filter down -}
        l = line KR (rand2 'β' 1) (rand2 'γ' 1) 8 DoNothing {- sweep pan -}
        r = map (\z -> 200 + linRand z 0 3000 0) (id_seq n 'δ')
        a = replicate n 1
        t = map (\z -> 0.2 + rand z 0 1) (id_seq n 'ε')  {- ring times -}
        k = klank (resonz e f 0.2) 1 0 1 (klankSpec r a t)
    in pan2 k l 1

rails_ot :: IO ()
rails_ot = O.overlapTextureU (3,2,4,maxBound) rails

-- | bouncing objects (jmcc) #2
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

-- | lots-o-sins (jmcc) #2
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

-- | clustered sines (jmcc) #2
clustered_sines :: UGen
clustered_sines =
  let cs z =
        let n = 80
            f1 = rand 'α' 100 1100
            f2 = 4 * f1
            sp = let y = map (\zz -> f1 + rand (z,zz) 0 f2) (id_seq n 'β')
                 in klangSpec y (map (f1 /) y) (replicate n 0)
        in klang AR 1 0 sp * (0.3 / fromIntegral n)
  in mce (map cs (id_seq 2 'δ'))

clustered_sines_xt :: IO ()
clustered_sines_xt = O.xfadeTextureU (4,4,maxBound) clustered_sines

-- | resonators harmonic series (jmcc) #2
resonators_harmonic_series :: UGen
resonators_harmonic_series =
    let p = 12
        noise = brownNoise 'α' AR * 0.001
        rat = [1.0,1.125,1.25,1.333,1.5,1.667,1.875,2.0,2.25,2.5,2.667,3.0,3.333,3.75,4.0]
        freq = lchoose 'β' rat * 120
        resFreqs = zipWith (+)
                   (C.series p freq freq)
                   (map (\z -> rand2 ('γ',z) 0.5) (enumFromN 'δ' p))
        spec = klankSpec
               resFreqs
               (map (\i -> 1 / (constant i + 1)) [0 .. p - 1])
               (map (\z -> rand ('ε',z) 0.5 4.5) (enumFromN 'ζ' p))
    in Protect.uclone_all 'η' 2 (klank noise 1 0 1 spec)

resonators_harmonic_series_xt :: IO ()
resonators_harmonic_series_xt = O.xfadeTextureU (1,7,maxBound) resonators_harmonic_series

-- | swept resonant noise (jmcc) #2
swept_resonant_noise :: UGen
swept_resonant_noise =
  let flt src z =
        let p = 10
            spec = klankSpec_mce
                   (RDU.linRandN p z 80 10080 0)
                   (mce (replicate p 1))
                   (RDU.randN p z 0.5 2.5)
        in klank src 1 0 1 spec
      n = whiteNoise 'α' AR * 0.007
      f = midiCPS (fSinOsc KR (rand 'β' 0.1 0.3) 0 * rand 'γ' 0 24 + rand 'δ' 36 84)
      sw = resonz n f 0.1
  in mce (map (flt sw) ['ε','ζ'])

swept_resonant_noise_ot :: IO ()
swept_resonant_noise_ot = O.overlapTextureU (4,4,5,maxBound) swept_resonant_noise

-- | coolant (jmcc) #2
coolant :: UGen
coolant =
    let p = 20
        s = onePole (mce (map (\z -> brownNoise z AR * 0.0015) (id_seq p 'α'))) 0.95
        n = replicate p 1
        sp z = klanx_spec_f id id (map (\z' -> rand (z,z') 40 2400) (id_seq p 'β')) n n
    in klank s 1 0 1 (mce (map mce (transpose (map sp ['γ','δ']))))

coolant_ot :: IO ()
coolant_ot = O.overlapTextureU (4,4,2,maxBound) coolant

-- | pulsing bottles (jmcc) #2
pulsing_bottles :: UGen
pulsing_bottles =
    let r z = let n = whiteNoise z AR
                  r0 = rand z 4 14
                  r1 = rand z 0 0.7
                  r2 = rand z 400 7400
              in resonz (n * lfPulse KR r0 0 0.25 * r1) r2 0.01
        s z = let f = rand z 0.1 0.5
                  p = rand z 0 (pi * 2)
              in sinOsc KR f p
    in sum (zipWith3 pan2 (map r (id_seq 6 'α')) (map s (id_seq 6 'β')) (repeat 1))

pulsing_bottles_ot :: IO ()
pulsing_bottles_ot = O.overlapTextureU (4,4,4,maxBound) pulsing_bottles

-- | what was i thinking? (jmcc) #2
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
narrow_band_filtered_crackle_noise :: UGen
narrow_band_filtered_crackle_noise =
    let e = envLinen 2 5 2 1
        rf1 = rand 'α' 0 2000 + 80
        rf2 = rf1 + (rand2 'β' 0.2 * rf1)
        rf = xLine KR rf1 rf2 9 DoNothing
        c = crackle AR 1.97 + rand 'γ' 0 0.03 * 0.15
    in pan2 (resonz c rf 0.2) (rand2 'δ' 1) (envGen AR 1 1 0 1 RemoveSynth e)

narrow_band_filtered_crackle_noise_st :: IO ()
narrow_band_filtered_crackle_noise_st =
  O.spawnTextureU (const 2,maxBound) narrow_band_filtered_crackle_noise

-- | resonant dust (jmcc) #2
resonant_dust :: UGen
resonant_dust =
    let rf = let st = rand 'α' 80 2080
                 en = st + (rand 'β' (-0.5) 0.5 * st)
             in xLine KR st en 9 DoNothing
        d = dust 'γ' AR (rand 'δ' 50 850) * 0.3
    in pan2 (resonz d rf 0.1) (rand 'ε' (-1) 1) 1

resonant_dust_ot :: IO ()
resonant_dust_ot = O.overlapTextureU (5,2,9,maxBound) resonant_dust

-- | police state (jmcc) #2
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

police_state :: UGen
police_state = uid_st_eval police_state_m

-- | uplink (jmcc) #2
uplink :: UGen
uplink =
    let r = rand0
        p0 = lfPulse KR (r 'α' 20) 0 (r 'β' 1)
        p1 = lfPulse KR (r 'γ' 4) 0 (r 'δ' 1) * r 'ε' 8000 + r 'ζ' 2000
        f = mix (Protect.uclone_all 'η' 2 (p0 * p1))
    in pan2 (lfPulse AR f 0 0.5 * 0.04) (rand 'θ' (-0.8) 0.8) 1

uplink_ot :: IO ()
uplink_ot = O.overlapTextureU (4,1,5,maxBound) uplink

-- | data space (jmcc) #2
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

-- | cymbalism (jmcc) #2
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

-- | cymbalism accelerando (jmcc) #2
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

-- | ring modulated klank (jmcc) #2
ring_modulated_klank :: UGen
ring_modulated_klank =
    let p = 8
        k = let sp = klankSpec_mce (RDU.randN p 'α' 100 10000)
                                   (mce (replicate p 1))
                                   (RDU.randN p 'α' 0.2 1)
            in klank (dust 'α' AR 20 * 0.02) 1 0 1 sp
        f = lfNoise2 'α' KR (rand 'α' 0.1 0.4) * 200 + rand 'α' 350 400
    in pan2 (sinOsc AR f 0 * k) (rand 'α' (-1) 1) 1

ring_modulated_klank_ot :: IO ()
ring_modulated_klank_ot = O.overlapTextureU (4,4,4,maxBound) ring_modulated_klank

-- * SC2-3

-- | analogue daze (jmcc) #3
analogue_daze :: UGen
analogue_daze =
    let patternList = [55,63,60,63,57,65,62,65]
        f k octave clockRate pwmrate fltrate =
            let trg = impulse KR clockRate 0
                freq = map (midiCPS .  (+ (12 * octave))) patternList
                sq = dsequ 'α' freq trg
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

-- * reverberated_sine_percussion (jmcc) #3
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

-- | analog bubbles with mouse control (jmcc) #3
analog_bubbles_mouse :: UGen
analog_bubbles_mouse =
  let y = mouseY KR 0.1 10 Exponential 0.2 {- lfo 1 rate -}
      x = mouseX KR 2 40 Exponential 0.2  {- lfo 2 rate -}
      o2 = lfSaw KR x 0 * (-3) + 80 {- depth & offset in semitones -}
      o1 = lfSaw KR y 0 * 24 + o2 {- depth in semitones, offset is lfo_2 -}
      f = midiCPS o1 {- convert to frequency -}
      s = sinOsc AR f 0 * 0.04
  in combN s 0.2 0.2 4 {- echoing sine wave -}

-- * SC2-4

-- | berlin 1977 (jmcc) #4
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

-- | metal plate (jmcc) #4
metal_plate :: UGen
metal_plate =
    let
        sr = 48000::Double
        n = 4 {- number of delay lines -}
        maxdt = ceiling (sr * 0.03) {- maximum delay time -}
        mk_buf k = asLocalBuf k (replicate maxdt 0)
        buf = map mk_buf [0 .. n - 1] {- buffers for delay lines -}
        tap_tm = map (\z -> rand ('α',z) 0.015 0.03) (enumFromN 'β' n) {- random tap times -}
        exc_freq = mouseY KR 10 8000 Linear 0.2
        exc_trig = impulse AR 0.5 0 * 0.2
        exc = decay2 exc_trig 0.01 0.2 * lfNoise2 'γ' AR exc_freq {- excitation -}
        del = zipWith (tap 1) buf tap_tm {- delay line taps -}
        flt_freq = mouseX KR 10 5000 Linear 0.2
        flt = map (\i -> lpf i flt_freq * 0.98) del {- tap filters -}
        wr_f b f = recordBuf AR b 0 1 0 1 Loop 1 DoNothing (f + exc)
        wr = zipWith wr_f buf flt {- write to delay lines -}
    in mrg (sum flt : wr)

-- | sample and hold liquidities (jmcc) #4
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

-- | random panning sines (jmcc) #4
random_panning_sines_m :: UId m => m UGen
random_panning_sines_m = do
  let nd = do r0 <- linRandM 80 2000 0
              let o = fSinOsc AR r0 0
              l <- lfNoise1M KR =<< randM 0.8 1.2
              a <- lfNoise1M KR =<< randM 0.82 0.98
              return (pan2 o l a)
  r <- clone 8 nd
  return (mix r * (0.4 / 8))

random_panning_sines :: UGen
random_panning_sines = uid_st_eval random_panning_sines_m

random_panning_sines_ot :: IO ()
random_panning_sines_ot = O.overlapTextureU (8,8,2,maxBound) random_panning_sines

-- * SC2-5

-- | distort input (jmcc) #5
distort_input :: UGen
distort_input =
    let gain = mouseX KR 1 100 Exponential 0.2 {- gain into distortion -}
    in distort (soundIn (mce2 0 1) * gain) * 0.4

-- | ring modulate input (jmcc) #5
ring_modulate_input :: UGen
ring_modulate_input =
    let input = soundIn (mce2 0 1)
        x = mouseX KR 10 4000 Exponential 0.2 {- ring mod freq -}
        modulator = sinOsc AR x (mce2 0 (0.5 * pi)) {- offset phase of one osc by 90 degrees -}
    in input * modulator

-- | filter input (jmcc) #5
filter_input :: UGen
filter_input =
    let rQ = mouseY KR 0.01 1 Exponential 0.2 {- bandwidth ratio = 1/Q -}
        cf = mouseX KR 100 12000 Exponential 0.2 {- cutoff freq -}
        sg = soundIn (mce2 0 1) * 0.4 * sqrt rQ {- attenuate to offset resonance -}
    in rlpf sg cf rQ

-- * SC2-6

-- | sweepy noise (jmcc) #6
sweepy_noise :: UGen
sweepy_noise =
    let n = mce2 (whiteNoise 'α' AR) (whiteNoise 'β' AR)
        lfoDepth = mouseY KR 200 8000 Exponential 0.1
        lfoRate = mouseX KR 4 60 Exponential 0.1
        freq = lfSaw KR lfoRate 0 * lfoDepth + (lfoDepth * 1.2)
        filtered = rlpf (n * 0.03) freq 0.1
    in combN filtered 0.3 0.3 2 + filtered

-- | string wander-cluster (jmcc) #6
string_wander_cluster :: (Double,R.StdGen) -> (UGen,(Double,R.StdGen))
string_wander_cluster (n0,g0) =
  let (n1,g1) = R.randomR (-7,8) g0
      n2 = foldToRange 50 120 (n0 + n1)
      d = 1 / midiCPS (constant n2)
      w = whiteNoise 'α' AR * 0.008
      o = combC w 0.01 d (d * 1000)
  in (pan2 o (rand 'β' (-1) 1) 1,(n2,g1))

string_wander_cluster_ot :: IO ()
string_wander_cluster_ot =
  O.overlapTextureS (4/3,4/3,6,maxBound) string_wander_cluster (60,R.mkStdGen 0)

-- | comb delay sweeps (jmcc) #6
comb_delay_sweeps :: (Double,Double,R.StdGen) -> (UGen,(Double,Double,R.StdGen))
comb_delay_sweeps (s0,e0,g0) =
  let (s1,g1) = R.randomR (-7,8) g0
      (e1,g2) = R.randomR (-7,8) g1
      s2 = foldToRange 50 120 (s0 + s1)
      e2 = foldToRange 50 120 (e0 + e1)
      l = line KR (constant s2) (constant e2) 4 DoNothing
      w = whiteNoise 'α' AR * 0.005
      d = 1 / midiCPS l
      c = 1 / midiCPS (constant s2)
      o = combC w 0.01 d (c * 1000)
  in (pan2 o (rand 'β' (-1) 1) 1,(s2,e2,g2))

comb_delay_sweeps_ot :: IO ()
comb_delay_sweeps_ot =
  O.overlapTextureS (4/3,4/3,9,maxBound) comb_delay_sweeps (60,61,R.mkStdGen 3567824)

-- | noise burst sweep (jmcc) #6
noise_burst_sweep :: UGen
noise_burst_sweep =
  let n = mce2 (whiteNoise 'α' AR) (whiteNoise 'β' AR)
      lfoRate = rand 'γ' (-1) 1 + mouseX KR 10 60 Exponential 0.2
      amp = max 0 (lfSaw KR lfoRate (-1))
      cfreq = mouseY KR 400 8000 Exponential 0.2
      freq = sinOsc KR 0.2 0 * cfreq + (1.05 * cfreq)
  in resonz (n * amp) freq 0.1

noise_burst_sweep_ot :: IO ()
noise_burst_sweep_ot = O.overlapTextureU (4,2,4,maxBound) noise_burst_sweep

-- | saucer base (jmcc) #6
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

-- | alien meadow (jmcc) #6
alien_meadow :: UGen
alien_meadow =
    let b = rand 'α' 0 5000
        f = sinOsc AR (rand 'β' 0 20) 0 * b * 0.1 + b
    in pan2 (sinOsc AR f 0) (rand 'γ' (-1) 1) (sinOsc AR (rand 'δ' 0 20) 0 * 0.05 + 0.05)

alien_meadow_ot :: IO ()
alien_meadow_ot = O.overlapTextureU (2,6,6,maxBound) alien_meadow

-- | birdies (jmcc) #6
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

-- | phase modulation with slow beats (jmcc) #6
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

-- | hard sync sawtooth with lfo (jmcc) #6
hsswl :: UGen
hsswl =
    let f = midiCPS (30 + iRand 'α' 0 50)
        o = sinOsc KR 0.2 (mce [0, rand 'β' 0 (2 * pi)]) * (2 * f) + (3 * f)
    in syncSaw AR (mce [f, f + 0.2]) o * 0.05

hsswl_pp :: UGen -> UGen
hsswl_pp z = combN z 0.3 0.3 4 + mceReverse z

hsswl_ot :: IO ()
hsswl_ot = O.overlapTextureU_pp (4,4,4,maxBound) hsswl 2 hsswl_pp

-- | noise modulated sines (jmcc) #6
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

-- | noise modulated sawtooths (jmcc) #6
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

-- * SC2-7

-- | aleatoric quartet (jmcc) #7
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
  let p_sp = zipWith3 klangSpec_k p_fr p_am p_ph
      q_sp = zipWith3 klangSpec_k q_fr q_am q_ph
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
  let p_sp = zipWith3 klangSpec_k p_fr p_am p_ph
      q_sp = zipWith3 klangSpec_k q_fr q_am q_ph
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

-- | tapping tools (jmcc) #7
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
    in Protect.useq_all 'η' 3 f z

tapping_tools_ot :: IO ()
tapping_tools_ot = O.overlapTextureU_pp (2,1,3,maxBound) tapping_tools 2 tapping_tools_pp

-- * SC2-8

-- | modal space, using local buffer (jmcc) #8
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

-- | landon rose (jmcc) #8
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

-- * SC2-9

-- | deep trip (jmcc) #9
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

-- | sawed cymbals (jmcc) #9
sawed_cymbals :: UGen
sawed_cymbals =
    let y = let f1 = rand 'α' 500 2500
                f2 = rand 'α' 0 8000
                f = Protect.uclone_seq (const False) 'α' 15 (rand 'α' f1 (f1 + f2))
                rt = Protect.uclone_seq (const False) 'α' 15 (rand 'α' 2 6)
          in klankSpec f (replicate 15 1) rt
        z = Protect.uclone_all 'α' 2 y
        fS = xLine KR (rand 'α' 0 600) (rand 'β' 0 600) 12 DoNothing
    in klank (lfSaw AR fS 0 * 0.0005) 1 0 1 (mceTranspose z)

sawed_cymbals_ot :: IO ()
sawed_cymbals_ot = O.overlapTextureU (4,4,6,maxBound) sawed_cymbals

-- | sidereal time (jmcc) #9
sidereal_time :: UGen
sidereal_time =
  let p = 15
      z = let y = let fr = Protect.uclone_seq (const False) 'α' p (expRand 'β' 100 6000)
                      rt = Protect.uclone_seq (const False) 'γ' p (rand 'δ' 2 6)
                  in klankSpec fr (replicate p 1) rt
          in Protect.uclone_all 'ε' 2 y
      f = xLine KR (expRand 'ζ' 40 300) (expRand 'η' 40 300) 12 DoNothing
      t = let e = lfNoise2 'θ' KR (rand 'ι' 0 8)
          in lfPulse AR f 0 (rand 'κ' 0.1 0.9) * 0.002 * max 0 e
      o = distort (klank t 1 0 1 (mceTranspose z)) * 0.1
  in combN o 0.6 (rand 'λ' 0.1 0.6) 8 + mceReverse o

sidereal_time_ot :: IO ()
sidereal_time_ot = O.overlapTextureU (4,4,6,maxBound) sidereal_time

-- | contamination zone (jmcc) #9
contamination_zone :: UGen
contamination_zone =
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

contamination_zone_pp :: UGen -> UGen
contamination_zone_pp =
    let f x = allpassN x 0.04 (RDU.randN 2 'ν' 0 0.04) 16
    in Protect.useq_all 'ξ' 6 f

contamination_zone_ot :: IO ()
contamination_zone_ot =
  O.overlapTextureU_pp (3,8,4,maxBound) contamination_zone 2 contamination_zone_pp

-- * SC2-10

-- | choip (jmcc) #10
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
    in Protect.useq_all 'κ' 4 f

choip_ot :: IO ()
choip_ot = O.overlapTextureU_pp (10,1,8,maxBound) choip 2 choip_pp

-- * SC2-11

strummable_guitar_str :: UGen -> (Int,Char) -> UGen
strummable_guitar_str sc (ix,z) =
    let k = constant ix
        x = mouseX KR 0 1 Linear 0.2
        t = abs (hpz1 (x `greater_than` (0.25 + k * 0.1)))
        e = decay t 0.05
        n = pinkNoise z AR * e
        dt = 1 / midiCPS sc
        s = combL n dt dt 4
    in pan2 s (k * 0.2 - 0.5) 1

-- | strummable guitar (jmcc) #11
strummable_guitar :: UGen
strummable_guitar =
    let scale = [52,57,62,67,71,76]
        strs = sum (zipWith strummable_guitar_str scale (zip [0..] ['a'..]))
    in leakDC (lpf strs 12000) 0.995

-- * SC2-12

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
    let x = rand 'ε' 0 1 `greater_than` 0.8
        m = lchoose 'ζ' [60,72] + lchoose 'η' dpr_scale + Protect.uclone_all 'θ' 2 (rand2 'ι' 0.05)
    in sinOsc AR (midiCPS m) 0 * x * rand 'κ' 0.04 0.07

dpr_rhy :: UGen
dpr_rhy =
    let m = lchoose 'λ' [48, 60, 72, 84] + lchoose 'μ' dpr_scale + Protect.uclone_all 'ν' 2 (rand2 'ξ' 0.03)
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

-- | early space music LP, side 2 (jmcc) #12
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
    in sum (map o (id_seq 12 'ο')) * a

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
    in sum (map c (id_seq 5 'Θ')) * 0.3

esmlp2_ot :: IO ()
esmlp2_ot = do
  let g = R.mkStdGen 0
  O.overlapTextureS_pp (4,2,6,maxBound) esmlp2 g 2 esmlp2_pp

-- | impulse sequencer (jmcc) SC2
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

