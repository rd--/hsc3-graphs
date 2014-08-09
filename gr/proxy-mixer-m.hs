-- > Sound.SC3.UGen.Help.viewSC3Help "ProxyMixer"

import Control.Monad {- base -}
import Sound.SC3 {- hsc3 -}
import qualified Sound.SC3.Lang.Random.IO as L {- hsc3-lang -}

mk_e :: IO (Envelope UGen)
mk_e = do
  l <- replicateM 11 (L.rand2 1)
  t <- replicateM 10 (L.rand 1)
  return (Envelope l t [EnvNum 0] (Just 9) (Just 0))

mce_scramble :: UGen -> IO UGen
mce_scramble u = fmap mce (L.scramble (mceChannels u))

pm :: IO UGen
pm = do
  e <- mk_e
  let env = envGen KR 1 1 0 1 DoNothing e
      p = midiRatio (env * mce [1, 0.33, -1] * 19) * 250
  p' <- mce_scramble p
  p'' <- mce_scramble p
  let o = formant AR p (p' * 2) p''
  return (out 0 (splay o 1 1 0 True * 0.1))

main :: IO ()
main = pm >>= audition
