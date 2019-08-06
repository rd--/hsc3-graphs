-- feedr (rd, 2006-09-12)
-- warning: input/output feedback loop

import Sound.OSC.FD {- hosc -}
import Sound.SC3.FD {- hsc3 -}

delayWr :: UGen -> UGen -> UGen
delayWr b = recordBuf AR b 0 1 0 1 Loop 0 DoNothing

tap' :: Int -> UGen -> UGen -> UGen
tap' nc b dt = playBuf nc AR b 1 0 (dt * (- sampleRate)) Loop DoNothing

-- (soundin channels,delay-line-length:seconds,number-of-taps)
type Param = (UGen,Double,Int)

feedr_gen :: UId m => Param -> m UGen
feedr_gen (ch,dl,n) = do
  t <- sequence (replicate n (randM 0.0 (constant dl)))
  g <- sequence (replicate n (randM 0.4 1.0))
  f <- sequence (replicate n (randM 0.9 0.95))
  let d = zipWith (\p q -> tap' 2 10 p * q) t g
      x = mouseX KR 0.02 1.0 Exponential 0.1
      s = clip2 (leakDC (hpf (sum d) 20) 0.995) 1
      i = soundIn ch
      r = i + sum (map (* x) (zipWith (*) d f))
  return (mrg [out 0 s, delayWr 10 r])

feedr_alloc :: Transport t => Param -> t -> IO ()
feedr_alloc (_ch,dl,_n) fd = do
  nf <- fmap (* dl) (serverSampleRateActual fd)
  sendMessage fd (b_alloc 10 (floor nf) 2)

main :: IO ()
main = do
  let p = (mce2 0 1,6,18)
  withSC3 (feedr_alloc p)
  audition =<< feedr_gen p

-- withSC3 (\fd -> sendMessage fd (b_zero 10))
