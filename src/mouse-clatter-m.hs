-- mouse clatter (rd)

import Sound.OSC
import Sound.SC3.Monadic

mouse_clatter :: UId m => m UGen
mouse_clatter = do
  let x = mouseX KR 100 12000 Linear 0.1
      y = mouseY KR 0.01 0.15 Linear 0.1
  n1 <- lfNoise0 KR (mce [3,3.25])
  let t = impulse KR (n1 * 16 + 18) 0
  n2 <- tRand 0.005 y t
  n3 <- whiteNoise AR
  n4 <- tRand 10 x t
  n5 <- tRand 0 1 t
  n6 <- tExpRand 0.15 1 t
  o <- let e = decay2 t 0.01 n2
       in return (bpf (n3 * e) n4 n5)
  n7 <- pv_RandComb (fft' 10 o) n6 t
  return (o * 0.05 + ifft' n7)

run :: (UId m,Transport m) => m ()
run = do
  _ <- async (b_alloc 10 2048 1)
  play . out 0 =<< mouse_clatter

main :: IO ()
main = withSC3 run

{-
s.sendMsg('b_alloc', 10, 2048, 1);
-}
