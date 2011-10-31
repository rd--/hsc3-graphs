-- bs-070705 (rd)

import Control.Monad
import Sound.SC3.Monadic
import Sound.OpenSoundControl
import System.Random

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
alloc_data :: Int -> IO ()
alloc_data n = do
  let alloc fd m b = async fd (b_alloc b m 1)
  withSC3 (\fd -> mapM_ (alloc fd n) [10, 11, 12])

-- | Simple synthesis renderer, r is the impulse frequency (trigger rate).
play_data :: UGen -> IO ()
play_data r = do
  let inf_sc = 9e8
  phase <- dseries inf_sc 0 1
  f' <- dbufrd 10 phase Loop
  a' <- dbufrd 11 phase Loop
  p' <- dbufrd 12 phase Loop
  let tr = impulse AR r 0
      f'' = demand tr 0 f'
      a'' = demand tr 0 a'
      p'' = demand tr 0 p'
  audition (out 0 (pan2 (ringz tr (midiCPS f'') 0.2) p'' a''))

-- | Randomize initial data of /n/ places, /s/ sort for
--   /m/ steps, pause for i seconds between each step.
run_data :: ([Double] -> [Double]) -> Int -> Int -> Double -> IO ()
run_data s n m i = do
  f <- rrandl n 32 96
  a <- rrandl n 0.25 1
  p <- rrandl n (-1) 1
  let prepare l' = take m (iterate s l')
      f' = prepare f
      a' = prepare a
      p' = prepare p
      l fd i' (f'', a'', p'') = do
                     send fd (b_setn 10 [(0, f'')])
                     send fd (b_setn 11 [(0, a'')])
                     send fd (b_setn 12 [(0, p'')])
                     pauseThread i'
      c fd = mapM_ (l fd i) (zip3 f' a' p')
  withSC3 c

-- | A random number.
rrand :: Double -> Double -> IO Double
rrand l r = getStdRandom (randomR (l,r))

-- | A list of random numbers.
rrandl :: Int -> Double -> Double -> IO [Double]
rrandl n l r = replicateM n (rrand l r)

-- | Run 'odd_even' for 32 iterations at 1 second intervals.
main :: IO ()
main = do
  alloc_data 96
  play_data 24
  run_data odd_even 96 32 1

{--
alloc_data 96
play_data 24 >> run_data odd_even 96 96 0.35
play_data 24 >> run_data bubble 96 64 0.75
play_data 24 >> run_data bubble 96 64 0.25
play_data 24 >> run_data bubble 96 32 0.25
play_data 24 >> run_data odd_even 96 16 0.25
--}

