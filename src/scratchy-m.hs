-- scratchy-m (jmcc)

import Sound.SC3.Monad

scratchy :: UId m => m UGen
scratchy = do
  n <- clone 2 (brownNoise AR)
  let f = max (n * 0.5 - 0.49) 0 * 20
  return (rhpf f 5000 1)

main :: IO ()
main = audition . out 0 =<< scratchy
