-- 08091500Acid309 by_otophilia

import Data.List {- base -}
import Data.Maybe
import Sound.OSC {- hosc -}
import Sound.SC3 {- hsc3 -}
import System.Random {- random -}

-- * Instruments

mk_ec :: [UGen] -> [EnvCurve]
mk_ec = map EnvNum

mk_env :: [UGen] -> [UGen] -> [UGen] -> Envelope UGen
mk_env l t c = Envelope l t (mk_ec c) Nothing Nothing

kick :: Synthdef
kick =
    let bus = control KR "outBus" 0
        env0 = let d = mk_env [0.5,1,0.5,0] [0.005,0.06,0.26] [-4,-2,-4]
               in envGen AR 1 1 0 1 RemoveSynth d
        env1 = let d = mk_env [110,59,29] [0.005,0.29] [-4,-5]
               in midiCPS (envGen AR 1 1 0 1 DoNothing d)
        s = let p = lfPulse AR env1 0 0.5 - 0.5
                q = p + mce2 (whiteNoise 'α' AR) (whiteNoise 'β' AR)
                r = lpf q (env1 * 1.5) * env0
            in clip2 (r + sinOsc AR env1 0.5 * env0 * 1.2) 1
    in synthdef "kick" (out bus s)

snare :: Synthdef
snare =
    let bus = control KR "outBus" 0
        amp = control KR "amp" 0.8
        env0 = let d = mk_env [0.5,1,0.5,0] [0.005,0.03,0.10] [-4,-2,-4]
               in envGen AR 1 1 0 1 DoNothing d
        env1 = let d = mk_env [110,60,49] [0.005,0.1] [-4,-5]
               in midiCPS (envGen AR 1 1 0 1 DoNothing d)
        env2 = let d = mk_env [1,0.4,0] [0.05,0.13] [-2,-2]
               in envGen AR 1 1 0 1 RemoveSynth d
        oscs = let p = lfPulse AR env1 0 0.5 - 0.5
                   q = lfPulse AR (env1 * 1.6) 0 0.5 * 0.5 - 0.25
                   r = lpf (p + q) (env1 * 1.2) * env0
               in r + sinOsc AR env1 0.8 * env0
        noise = let p = mce2 (whiteNoise 'γ' AR) (whiteNoise 'δ' AR) * 0.2
                    q = hpf p 200 * 2
                    r = bpf q 6900 0.6 * 3 + p
                in r * env2
        s = clip2 (oscs + noise) 1 * amp
    in synthdef "snare" (out bus s)

clap :: Synthdef
clap =
    let bus = control KR "outBus" 0
        amp = control KR "amp" 0.5
        env1 = let d = mk_env [0,1,0,1,0,1,0,1,0]
                              [0.001,0.013,0,0.01,0,0.01,0,0.03]
                              [0,-3,0,-3,0,-3,0,-4]
               in envGen AR 1 1 0 1 DoNothing d
        env2 = let d = mk_env [0,1,0] [0.02,0.3] [0,-4]
               in envGen AR 1 1 0 1 RemoveSynth d
        noise1 = let p = mce2 (whiteNoise 'ε' AR) (whiteNoise 'ζ' AR) * env1
                     q = hpf p 600
                 in bpf q 2000 3
        noise2 = let p = mce2 (whiteNoise 'η' AR) (whiteNoise 'θ' AR) * env2
                     q = hpf p 1000
                 in bpf q 1200 0.7 * 0.7
        s = let p = noise1 + noise2
            in softClip (p * 2) * amp
    in synthdef "clap" (out bus s)

hat :: Synthdef
hat =
    let bus = control KR "outBus" 0
        amp = control KR "amp" 0.3
        env1 = let d = mk_env [0,1.0,0] [0.001,0.2] [0,-12]
               in envGen AR 1 1 0 1 DoNothing d
        env2 = let d = mk_env [0,1.0,0.05,0] [0.002,0.05,0.03] [0,-4,-4]
               in envGen AR 1 1 0 1 RemoveSynth d
        (r0:r1:r2:_) = randomRs (-4.0,4.0) (mkStdGen 5)
        oscs1 = let n1 = 5
                    f i = let f0 = midiCPS (linLin i 0 (n1-1) 42 75 + r0)
                              f1 = midiCPS (linLin i 0 (n1-1) 78 80 + r1)
                          in sinOsc AR f0 (sinOsc AR f1 0 * 12) * (1/n1)
                    p = sum (map f [0..n1-1])
                in bHiPass p 1000 2 * env1
        noise = let n2 = 8
                    p = whiteNoise 'ι' AR
                    f i = let t = 1 / midiCPS (linLin i 0 (n2-1) 40 50 + r2)
                          in combN p 0.05 t 0.1
                    q = sum (map f [0..n2-1]) * (1/n2) + p
                    r = bpf q 6000 0.9 * 0.5 + q
                in bHiPass (bLowShelf r 3000 0.5 (-6)) 1000 1.5 * env2
        s = softClip (noise + oscs1) * amp
    in synthdef "hat" (out bus s)

acid :: Synthdef
acid =
    let bus = control KR "outBus" 0
        gate' = control KR "gate" 1
        pitch' = control KR "pitch" 50
        amp = control KR "amp" 0.3
        pitch'' = lag pitch' 0.12 * (1 - trig gate' 0.001) * gate'
        env1 = let d = Envelope [0,1,0,0] [0.001,2,0.04] (mk_ec [0,-4,-4]) (Just 2) (Just 0)
               in envGen AR gate' amp 0 1 DoNothing d
        env2 = let d = envADSR 0.001 0.8 0 0.8 70 (EnvNum (-4)) 0
               in envGen AR gate' 1 0 1 DoNothing d
        s = let p = lfPulse AR (midiCPS pitch'') 0.0 0.51 * 2 - 1
                q = rlpf p (midiCPS (pitch'' + env2)) 0.3
            in q * env1
    in synthdef "acid" (out bus (mce2 s s))

fx :: Synthdef
fx =
    let bus = control KR "outBus" 0
        gate' = control KR "gate" 0
        i = in' 2 AR bus
        e = let d = Envelope [0.02,0.3,0.02] [0.4,0.01] (mk_ec [3,-4]) (Just 1) (Just 0)
            in envGen KR (1 - trig gate' 0.01) 1 0 1 DoNothing d
        r = let [i0,i1] = mceChannels i
            in freeVerb2 (bpf i0 3500 1.5) (bpf i1 3500 1.5) 1 0.95 0.15 * e
        s = limiter (hpf ((i + r) * 1.2) 40) 1 0.02
    in synthdef "fx" (replaceOut bus s)

-- * Sequences

type D = [Int]

dr_seq :: Num a => [[[a]]]
dr_seq =
    let s = [[[1,0,0,0, 0,0,0,0, 1,0,0,1, 0,0,1,0]
             ,[0,0,0,0, 0,0,0,2, 0,2,1,0, 4,3,3,3]
             ,[0,0,0,0, 4,0,0,0, 0,0,0,0, 4,0,0,0]
             ,[1,2,4,0, 1,0,4,0, 1,2,4,2, 1,0,4,2]
             ,[1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0]]
            ,[[0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0]
             ,[0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0]
             ,[0,0,0,0, 4,0,0,0, 0,0,0,0, 4,0,0,0]
             ,[1,2,4,0, 1,0,4,0, 1,2,4,2, 1,0,4,2]
             ,[1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0]]
            ,[[1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0]
             ,[0,0,0,0, 0,0,0,2, 0,0,0,0, 0,0,0,0]
             ,[0,0,0,0, 4,0,0,0, 0,0,0,0, 4,0,0,0]
             ,[1,2,4,0, 1,0,4,0, 1,2,4,2, 1,0,4,2]
             ,[1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0]]
            ,[[1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0]
             ,[0,0,0,0, 4,0,0,2, 0,0,0,0, 4,0,0,0]
             ,[0,0,0,0, 0,0,0,0, 0,0,0,0, 4,0,0,0]
             ,[1,2,4,0, 1,0,4,0, 1,2,4,2, 1,0,4,2]
             ,[1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0]]]
    in map transpose s

dr_msg :: Int -> (Int,Int) -> Maybe Message
dr_msg fx_id (i,x) =
    let m nm pr = Just (s_new nm (-1) AddToHead 1 pr)
        x' = fromIntegral x
        sq n = n * n
    in case i of
         0 -> if x > 0 then m "kick" [] else Nothing
         1 -> if x > 0 then m "snare" [("amp",sq (x'/4) * 0.7)] else Nothing
         2 -> if x > 0 then m "clap" [("amp",sq (x'/4) * 0.5)] else Nothing
         3 -> if x > 0 then m "hat" [("amp",sq (x'/4) * 0.32)] else Nothing
         4 -> Just (n_set fx_id [("gate",x')])
         _ -> error "dr_seq_msg"

dr_seq_bundle :: Int -> Double -> D -> Bundle
dr_seq_bundle fx_id t =
    bundle t .
    mapMaybe (dr_msg fx_id) .
    zip [0..]

b_seq :: Num a => [[a]]
b_seq =
    let s = [[1,1,1,1, 1,1,1,1, 0,1,0,1, 1,1,1,0]
            ,[1,1,0,2, 1,1,0,0, 2,0,2,0, 1,2,0,4]
            ,map (+ 38) [-24,-12,0,-12, 0,-12,10,12, 0,7,-7,0, -11,1,13,15]]
    in transpose s

type B = (Int,Double,Double)

b_form :: [Int] -> B
b_form xs =
    let i = fromIntegral
    in case xs of
         [b1,b2,b3] -> (b1,i b2,i b3)
         _ -> error "b_form"

b_seq_bundle :: Int -> Double -> Double -> B -> [Bundle]
b_seq_bundle acid_id dt t (b0,b1,b2) =
    let on = let p = n_set acid_id [("pitch",b2)]
                 m = if b0 == 1
                     then [p,n_set acid_id [("gate",1)]]
                     else [p]
             in bundle t m
        off = let end_t = t + (dt * b1 * 0.25 * 0.99)
              in bundle end_t [n_set acid_id [("gate",0)]]
    in if b1 > 0 then [on,off] else [on]

-- * Runtime

ao_init :: Transport m => m (Int,Int)
ao_init = do
  let i = [kick,snare,clap,hat,acid,fx]
  mapM_ async (map d_recv i)
  let acid_id = 10
      fx_id = 11
  send (s_new "acid" acid_id AddToHead 1 [("gate",0)])
  send (s_new "fx" fx_id AddToTail 1 [])
  return (acid_id,fx_id)

dt_seq :: Double -> [Double]
dt_seq bpm =
    let shf = 0.16
        n = 60 / bpm
        dt i = if i `mod` 2 == 0 then 0.25 * (1 + shf) else 0.25 * (1 - shf)
    in map ((* n) . dt) ([0..]::[Int])

ao_run_seq :: Transport m => (Int,Int) -> [D] -> [B] -> m ()
ao_run_seq (acid_id,fx_id) d_sq b_sq = do
  init_t <- time
  let dt_seq' = dt_seq 130
      t_seq = scanl1 (+) (init_t : dt_seq')
      act (t,dt,d,b) =
          do sendBundle (dr_seq_bundle fx_id t d)
             mapM_ sendBundle (b_seq_bundle acid_id dt t b)
             pauseThreadUntil t
  mapM_ act (zip4 t_seq dt_seq' d_sq b_sq)

main :: IO ()
main =
    let act = do
          let d_sq = cycle (concat dr_seq)
              b_sq = map b_form (cycle b_seq)
          ids <- ao_init
          ao_run_seq ids d_sq b_sq
  in withSC3 act
