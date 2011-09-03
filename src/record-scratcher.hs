-- record scratcher (josh parmenter)

import Sound.OpenSoundControl
import Sound.SC3

record_scratcher :: UGen
record_scratcher =
  let dup a = mce2 a a
      d = env [0, 1, 0] [0.1, 0.1] [EnvSin] 1 0
      e = envGen KR 1 0.5 0 1 RemoveSynth d
      x = mouseX' KR (-10) 10 Linear 0.2
      dx = x - delayN x 0.1 0.1
      bdx = mouseButton' KR 1 0 0.3 + dx
      bdxr = bdx * bufRateScale KR 0
      scr = playBuf 1 AR 0 bdxr 0 0 Loop DoNothing
  in dup (scr * e)

run :: Transport t => t -> IO ()
run fd = do
  let fn = "/home/rohan/data/audio/pf-c5.snd"
  _ <- async fd (b_allocRead 0 fn 0 0)
  play fd (out 0 record_scratcher)

main :: IO ()
main = withSC3 run
