-- | cds-070701 (rd)
--
-- The 'source' data are breakpoint sets normalized over the time
-- interval (0,1).  There are a fixed number of 'locations' per cycle.
-- The data sets are sampled at these locations and loaded into
-- buffers.  The buffers are read using dbufrd.  One of the data sets
-- gives the time interval to step forward.

import Sound.OSC {- hosc -}
import Sound.SC3 {- hsc3 -}

-- | Real
type R = Double

-- | Point
type P = (R,R)

-- | Data set
type D = [P]

-- | Points that bracket a time.
pts :: D -> R -> (P,P)
pts d n =
    case d of
      p0:p1:r -> let (t,_) = p1
                 in if n <= t
                    then (p0,p1)
                    else pts (p1:r) n
      _ -> error "pts"

-- | Linear interpolation.
--
-- > lerp 0.5 (0,0) (1,1) == (0.5,0.5)
-- > lerp 0.25 (0,0) (0.5,1) == (0.25,0.5)
lerp :: R -> P -> P -> P
lerp n (t0,d0) (t1,d1) =
  let n' = (n - t0) / (t1 - t0)
      f i = d0 + ((d1 - d0) * i)
  in (n,f n')

-- | Linear interpolating lookup.
lerpd :: D -> R -> P
lerpd t n =
  let (p0,p1) = pts t n
  in lerp n p0 p1

-- | Linearize in time (ie. /t/ is in equal steps).
rescale :: D -> Int -> D
rescale t n = map (lerpd t) [0,1 / fromIntegral n .. 1]

-- | Allocate data buffers for linearized envelopes.
alloc_data :: Int -> IO ()
alloc_data n = do
  let alloc b = async (b_alloc b n 1)
  withSC3 (mapM_ alloc [10,11,12,13])

-- | Data can be loaded while nodes are running, ie. edited online.
load_data :: Int -> (D,D,D,D) -> IO ()
load_data n (t,f,a,p) = do
  let setup d = map snd (rescale d n)
  withSC3 (do send (b_setn 10 [(0,setup t)])
              send (b_setn 11 [(0,setup f)])
              send (b_setn 12 [(0,setup a)])
              send (b_setn 13 [(0,setup p)]))

-- | Simple synthesis of data.
play_data :: IO ()
play_data = do
  let inf_sc = 9e8
  phase <- dseriesM inf_sc 0 1
  t' <- dbufrdM 10 phase Loop
  f' <- dbufrdM 11 phase Loop
  a' <- dbufrdM 12 phase Loop
  p' <- dbufrdM 13 phase Loop
  let tr = tDuty AR t' 0 DoNothing 1 0
      f'' = demand tr 0 f'
      a'' = demand tr 0 a'
      p'' = demand tr 0 p'
  audition (out 0 (pan2 (ringz tr f'' 0.2) p'' a''))

-- | Sample data sets, load using 'load_data'.
data_1 :: (D,D,D,D)
data_1 = ([(0,0.1),(0.65,0.025),(1,0.1)]
         ,[(0,200),(0.35,8900),(1,200)]
         ,[(0,0.35),(0.65,0.65),(1,0.35)]
         ,[(0,-1),(0.3,1),(1,-1)])

data_2 :: (D,D,D,D)
data_2 = ([(0,0.1),(0.5,0.005),(1,0.1)]
         ,[(0,100),(0.5,13900),(1,200)]
         ,[(0,0.75),(0.5,0.25),(1,0.75)]
         ,[(0,1),(0.5,-1),(1,1)])

data_3 :: (D,D,D,D)
data_3 = ([(0,0.01),(0.5,0.25),(1,0.01)]
         ,[(0,770),(0.5,77),(1,770)]
         ,[(0,0.9),(0.5,0.6),(1,0.9)]
         ,[(0,0),(0.5,1),(1,0)])

-- | Switch between data sets at /dd/ at time interval /t/.
data_switch :: [(D,D,D,D)] -> R -> IO ()
data_switch dd t =
    let w d = load_data 64 d >> pauseThread t
    in mapM_ w dd >> data_switch dd t

main :: IO ()
main = do
  alloc_data 64
  load_data 64 data_1
  play_data
  data_switch [data_1,data_2,data_3] 4
