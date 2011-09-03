-- chain saw (jrhb)

{- this graph generates long chains of unit generators and may require
increasing the stack limit of the haskell run time system -}

import Control.Monad
import qualified Sound.SC3.Lang.Random.IO as R
import Sound.SC3.Monadic

coinIf :: Double -> a -> a -> IO a
coinIf n a b = do
  r <- R.coin n
  return (if r then a else b)

exprange :: UGen -> UGen -> UGen -> UGen
exprange s l r = linExp s (-1) 1 l r

chain :: Monad m => Int -> (b -> m b) -> b -> m b
chain n fn = foldr (<=<) return (replicate n fn)

mceProduct :: UGen -> UGen
mceProduct = mceEdit (\l -> [product l])

clipu :: BinaryOp a => a -> a
clipu s = clip2 s 1

dup :: UGen -> UGen
dup a = mce2 a a

chain_saw :: IO UGen
chain_saw = do
  let f s1 = do xr <- fmap dup (expRand 0.1 2)
                n1 <- lfNoise1 KR xr
                n2 <- lfNoise1 KR xr
                n3 <- lfNoise1 KR xr
                f1 <- coinIf 0.6 (exprange n1 0.01 10) (exprange n2 10 50)
                s2 <- coinIf 0.5 (1 - s1) (mceReverse s1)
                let f2 = linExp s1 (-1) 1 f1 (f1 * exprange n3 2 10)
                    u1 = lfSaw KR f2 0
                    u2 = lfSaw KR (f1 * 0.1) 0 * 0.1 + 1
                return . clipu =<< coinIf 0.5 (u1 * s2) (u1 * u2)
      inp = lfSaw KR (0.2 * mce2 1 1.1) 0
      b_freq = mce [70, 800, 9000, 5242]
  ff <- chain 8 f inp
  let c_saw = mceProduct (saw AR (exprange ff 6 11000))
      b_saw = dup (mix (bpf c_saw b_freq 0.2))
  return (b_saw * 0.3)

main :: IO ()
main = audition . out 0 =<< chain_saw
