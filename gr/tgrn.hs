-- tgrn (rd)

import Sound.OSC {- hosc -}
import Sound.SC3.ID {- hsc3 -}

tgrn :: UGen -> UGen
tgrn b =
  let trate = mouseY KR 2 120 Exponential 0.1
      dur = 1.2 / trate
      clk = impulse AR trate 0
      pos = mouseX KR 0 (bufDur KR b) Linear 0.1
      pan = whiteNoise 'α' KR * 0.6
      n = roundTo (whiteNoise 'β' KR * 3) 1
      rate = shiftLeft 1.2 n
  in tGrains 2 clk b rate pos dur pan 0.5 2

run :: Transport m => m ()
run = do
  let fn = "/home/rohan/data/audio/pf-c5.snd"
  _ <- async (b_allocRead 10 fn 0 0)
  play (out 0 (tgrn 10))

main :: IO ()
main = withSC3 run
