-- bs-070705 (rd)

import Sound.OSC {- hosc -}
import Sound.SC3 {- hsc3 -}
import qualified Sound.SC3.Lang.Random.IO as R {- hsc3-lang -}

-- | One step in a bubble sort with specified /greater than/ function.
bubble_p :: (a -> a -> Bool) -> [a] -> [a]
bubble_p gt l =
    case l of
      e:f:g -> if e `gt` f
               then f : bubble_p gt (e : g)
               else e : bubble_p gt (f : g)
      _ -> l

-- | 'bubble_p' '>'.
bubble :: (Ord a) => [a] -> [a]
bubble = bubble_p (>)

-- | One step in /odd even/ sorting, a bubble sort variant.
odd_even :: (Ord a) => [a] -> [a]
odd_even = reverse . bubble_p (<) . reverse . bubble_p (>)

-- | Allocate required buffers to /n/ places.
alloc_data :: Transport m => Int -> m ()
alloc_data n = do
  let alloc m b = async (b_alloc b m 1)
  mapM_ (alloc n) [10, 11, 12]

-- | Simple synthesis renderer, r is the impulse frequency (trigger rate).
play_data :: (UId m,Transport m) => UGen -> m ()
play_data r = do
  let inf_sc = 9e8
  phase <- dseriesM inf_sc 0 1
  f' <- dbufrdM 10 phase Loop
  a' <- dbufrdM 11 phase Loop
  p' <- dbufrdM 12 phase Loop
  let tr = impulse AR r 0
      f'' = demand tr 0 f'
      a'' = demand tr 0 a'
      p'' = demand tr 0 p'
  play (out 0 (pan2 (ringz tr (midiCPS f'') 0.2) p'' a''))

-- | Randomize initial data of /n/ places, /s/ sort for
--   /m/ steps, pause for i seconds between each step.
run_data :: Transport m => ([Double] -> [Double]) -> Int -> Int -> Double -> m ()
run_data s n m i = do
  f <- R.nrrand n 32 96
  a <- R.nrrand n 0.25 1
  p <- R.nrrand n (-1) 1
  let prepare l' = take m (iterate s l')
      f' = prepare f
      a' = prepare a
      p' = prepare p
      l i' (f'', a'', p'') = do
                     sendMessage (b_setn 10 [(0, f'')])
                     sendMessage (b_setn 11 [(0, a'')])
                     sendMessage (b_setn 12 [(0, p'')])
                     pauseThread i'
  mapM_ (l i) (zip3 f' a' p')

-- | Run 'odd_even' for 32 iterations at 1 second intervals.
main :: IO ()
main = withSC3 (alloc_data 96 >> play_data 24 >> run_data odd_even 96 32 1)

{--
withSC3 (alloc_data 96)
withSC3 (play_data 24 >> run_data odd_even 96 96 0.35)
withSC3 (play_data 24 >> run_data bubble 96 64 0.75)
withSC3 (play_data 24 >> run_data bubble 96 64 0.25)
withSC3 (play_data 24 >> run_data bubble 96 32 0.25)
withSC3 (play_data 24 >> run_data odd_even 96 16 0.25)
--}
