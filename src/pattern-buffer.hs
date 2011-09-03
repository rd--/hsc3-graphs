-- pattern buffer (rd)

import Sound.OpenSoundControl
import Sound.SC3.Monadic
import System.Random

tseq :: [UGen] -> UGen
tseq l =
    let n = fromIntegral (length l) / 2.0
    in select (lfSaw KR 0.5 0 * n + n) (mce l)

rrand :: Random a => a -> a -> IO a
rrand l r = getStdRandom (randomR (l, r))

pattern_buffer :: Int -> IO UGen
pattern_buffer c = do
  let p = phasor AR 0 (bufRateScale KR 10) 0 (bufFrames KR 10) 0
      t = bufRdC 1 AR 10 p Loop
  r1 <- sequence (replicate c (rrand 36 96))
  r2 <- sequence (replicate c (rrand (-1.0) 1.0))
  r3 <- rrand 0 1
  n1 <- tRand 0.02 0.08 t
  let e = decay2 t 0.01 n1
      f = midiCPS (tseq r1)
      l = tseq r2
      o = [sinOsc AR f 0, saw AR f] !! r3
  return (pan2 o l e)

set_pattern :: Transport t => Int -> Int -> t -> IO ()
set_pattern nf c fd = do
  let rs = do r0 <- rrand 0 nf
              r1 <- rrand 0.0 1.0
              send fd (b_set1 10 r0 r1)
  sequence_ (replicate c rs)

fill_clr :: (Transport t) => Int -> Int -> Double -> Int -> t -> IO b
fill_clr nf c dt n fd = do
  let go i = if i == 0
             then do print "clr"
                     send fd (b_zero 10)
                     go n
             else do set_pattern nf c fd
                     print ("fill",i)
                     pauseThread dt
                     go (i - 1)
  go n

run :: Transport t => t -> IO ()
run fd = do
  let nf = 2 * 48000
      c = 24
      n = 16
      dt = 2.6
  _ <- async fd (b_alloc 10 (nf * 2) 1)
  play fd . out 0 =<< pattern_buffer c
  fill_clr nf c dt n fd

main :: IO ()
main = withSC3 run
