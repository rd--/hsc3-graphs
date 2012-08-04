-- feedr (rd)
-- warning: input/output feedback loop

import Sound.OSC.FD {- hosc -}
import Sound.SC3.Monad.FD {- hsc3 -}

delayWr :: UGen -> UGen -> UGen
delayWr b = recordBuf AR b 0 1 0 1 Loop 0 DoNothing

tap :: Int -> UGen -> UGen -> UGen
tap nc b dt = playBuf nc AR b 1 0 (dt * (- sampleRate)) Loop DoNothing

type State = (UGen,Double)

feedr :: (UId m) => State -> Int -> m UGen
feedr (ch,dl) n = do
  t <- sequence (replicate n (rand 0.0 (constant dl)))
  g <- sequence (replicate n (rand 0.4 1.0))
  f <- sequence (replicate n (rand 0.9 0.95))
  let d = zipWith (\p q -> tap 2 10 p * q) t g
      x = mouseX KR 0.02 1.0 Exponential 0.1
      s = clip2 (leakDC (hpf (sum d) 20) 0.995) 1
      i = soundIn ch
      r = i + sum (map (* x) (zipWith (*) d f))
  return (mrg [out 0 s, delayWr 10 r])

run :: Transport t => State -> t -> IO ()
run (ch,dl) fd = do
  nf <- fmap (* dl) (serverSampleRateActual fd)
  send fd (b_alloc 10 (floor nf) 2)
  audition =<< feedr (ch,dl) 18

main :: IO ()
main = withSC3 (run (mce2 4 5,6))

-- withSC3 (\fd -> send fd (b_zero 10))
