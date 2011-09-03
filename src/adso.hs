-- adso (rd)

import Sound.OpenSoundControl
import Sound.SC3
import System.Random

getb :: Real a => UGen -> a -> UGen
getb b j =
    let k = mce [0 .. constant j - 1]
    in bufRdN 1 KR b k NoLoop

adso :: Real a => a -> UGen
adso n =
    let m = sinOsc KR (getb 3 n) 0
        f = midiCPS (getb 0 n) * (m * getb 4 n + 1)
        l = getb 2 n
        g = getb 1 n
    in mix (pan2 (sinOsc AR f 0) l g)

rrand :: Random a => a -> a -> IO a
rrand l r = getStdRandom (randomR (l, r))

rrand_l :: Random a => Int -> a -> a -> IO [a]
rrand_l j l r = sequence (replicate j (rrand l r))

pattern :: Transport t => t -> Int -> Double -> IO ()
pattern fd n t = do
  z <- do l <- rrand 22 48
          r <- rrand 54 122
          sequence (replicate n (rrand l r))
  send fd (b_setn1 0 0 z)
  let rn i l r = do d <- rrand_l n l r
                    send fd (b_setn1 i 0 d)
  rn 1 0 0.1
  rn 2 (-1) 1
  rn 3 2 12
  rn 4 0.001 0.0075
  rn 5 1 24
  rn 6 0.05 2.4
  pauseThread t

run :: Transport t => Int -> t -> IO ()
run n fd = do
  mapM_ (\i -> async fd (b_alloc i n 1)) [0..6]
  _ <- play fd (out 0 (adso n))
  mapM_ (pattern fd n) =<< rrand_l 32 0.025 0.75
  reset fd

main :: IO ()
main = withSC3 (run 24)
