import Control.Monad {- base -}

import Sound.SC3 {- hsc3 -}
import Sound.SC3.Common.Monad.Operators ((+.),(.+.)) {- hsc3 -}

import qualified Sound.SC3.UGen.Protect as Protect {- hsc3-rw -}

import qualified Sound.SC3.Lang.Control.OverlapTexture as O {- hsc3-lang -}

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

-- > (putStrLn . synthstat) =<< scratchy_m
scratchy_m :: UId m => m UGen
scratchy_m = do
  n <- clone 2 (brownNoiseM AR)
  let f = max (n * 0.5 - 0.49) 0 * 20
  return (rhpf f 5000 1)

tremulate_m :: UId m => m UGen
tremulate_m = do
  f <- randM 500 900
  let o = fSinOsc AR (f * mce [1,1.2,1.5,1.8]) 0
  r <- randM 30 90
  n <- clone 4 (lfNoise2M KR r)
  let a = max 0 (n * 0.1)
  l <- clone 4 (randM (-1) 1)
  return (mix (pan2 o l a))

sprinkler_m :: UId m => m UGen
sprinkler_m = do
  n <- whiteNoiseM AR
  let f = lfPulse KR 0.09 0 0.16 * 10 + 7
      t = lfPulse KR f 0 0.25 * 0.1
  return (bpz2 (n * t))

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

-- > putStrLn $ synthstat_concise (cs1 'α')
-- > putStrLn $ synthstat_concise cs_protect
cs_protect :: UGen
cs_protect =
    let n = 80
        f1 = rand 'α' 100 1100
        f2 = 4 * f1
        sp = let y = Protect.uclone_seq (const False) 'β' n (f1 + rand 'γ' 0 f2)
             in klangSpec y (map (f1 /) y) (replicate n 0)
    in Protect.uclone_all 'δ' 2 (klang AR 1 0 sp * (0.3 / fromIntegral n))

-- > putStrLn $ synthstat_concise cs
-- > putStrLn $ synthstat_concise (uid_st_eval cs_m)
cs_m :: UId m => m UGen
cs_m = do
  let n = 80
  f1 <- randM 100 1100
  let f2 = 4 * f1
  y <- replicateM n (f1 +. randM 0 f2)
  let sp = klangSpec y (map (f1 /) y) (replicate n 0)
  return (klang AR 1 0 sp * (0.3 / fromIntegral n))

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

police_state_nd :: UGen
police_state_nd =
    let n = lfNoise2 'α' AR (rand 'β' 80 120)
        f = sinOsc KR (rand 'γ' 0.02 0.12) (rand 'δ' 0 (pi * 2)) *
            rand 'ε' 0 600 +
            rand 'ζ' 700 1300
    in pan2 (sinOsc AR f 0 * n * 0.1) (rand 'η' (-1) 1) 1

police_state :: UGen
police_state =
  let ns = Protect.uclone_all 'θ' 4 police_state_nd
      n0 = Protect.uclone_all 'ι' 2 (lfNoise2 'κ' KR 0.4)
      n1 = lfNoise2 'λ' AR (n0 * 90 + 620)
      n2 = lfNoise2 'μ' KR (mce2 0.3 0.301)
      e = n1 * (n2 * 0.15 + 0.18)
  in combL (mix ns + e) 0.3 0.3 3

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

-- * reverberated noise bursts (jmcc) #3
rnb :: UGen
rnb =
    let s = decay (dust 'α' AR 0.6 * 0.2) 0.15 * pinkNoise 'β' AR
        z = delayN s 0.048 0.048
        y = mix (combL z 0.1 (lfNoise1 'γ' KR (Protect.uclone_all 'δ' 6 (rand 'ε' 0 0.1)) * 0.04 + 0.05) 15)
        f = Protect.useq_all 'ζ' 4 (\i -> allpassN i 0.050 (Protect.uclone_all 'η' 2 (rand 'θ' 0 0.05)) 1)
    in s + f y

random_panning_sines :: UGen
random_panning_sines =
    let nd = let o = fSinOsc AR (linRand 'α' 80 2000 0) 0
                 l = lfNoise1 'β' KR (rand 'γ' 0.8 1.2)
                 a = lfNoise1 'δ' KR (rand 'ε' 0.82 0.98)
             in pan2 o l a
    in mix (Protect.uclone_all 'ζ' 8 nd) * (0.4 / 8)

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

birds_node :: UGen
birds_node =
  let swt = lfSaw AR (7 + rand2 'α' 1.5) (rand 'β' 0 1) * rand 'γ' 11 15
      mnn = lag swt 0.1 + rand 'δ' 94 102
      a = lfPulse KR (1 / rand 'ε' 12 15.6) (rand 'ζ' 0 1) 0.16 * 0.05
      b = sinOsc AR (midiCPS mnn) (rand 'η' 0 1) * a
  in rotate2 b (silent 1) (rand 'θ' (-1) 1)

birds :: UGen
birds =
  let d = mix (Protect.uclone_all 'α' 6 birds_node)
      f i = allpassL i 0.07 (rand 'β' 0 0.06) (rand 'γ' 0.7 2.0)
      w = Protect.useq_all 'δ' 12 f d
  in d * 0.7 + w * 0.3

{- | http://lists.create.ucsb.edu/pipermail/sc-users/2007-April/033239.html -}
babbling_brook :: UGen
babbling_brook =
  let b f m a g = let n3 = lpf (brownNoise 'α' AR) f * m + a
                      n4 = onePole (brownNoise 'β' AR) 0.99
                  in rhpf n4 n3 0.03 * g
      x = Protect.uclone_all 'γ' 2 (b 14 400 500 0.006)
      y = Protect.uclone_all 'δ' 2 (b 20 800 1000 0.010)
  in x + y

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
