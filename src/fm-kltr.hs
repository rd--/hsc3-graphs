-- fm-kltr (rd)

import Sound.OSC {- hosc -}
import Sound.SC3.Monad as U {- hsc3 -}
import Sound.SC3.Lang.Random.IO {- hsc3-lang -}

fm_kltr :: UId m => m UGen
fm_kltr = do
  r1 <- U.rand 0.975 1.025
  r2 <- U.rand 0.5 1.5
  r3 <- U.rand 0.975 1.025
  r4 <- U.rand 0.75 1.25
  let o = control IR "out" 0
      a = control KR "amp" 0.1
      d = control KR "dur" 0.1
      f = control KR "freq" 400.0
      i = control KR "index" 40.0
      p = control KR "pan" 0.0
      f2 = control KR "freq2" 600
      ep = envPerc 0.01 d
      e = envGen AR 1 a 0 1 RemoveSynth ep
      so = sinOsc AR (xLine KR f (f * r1) d DoNothing) 0
      xl = xLine KR f2 (f2 * r3) d DoNothing
      m = so * line KR i (f * r2) d DoNothing + xl
      l = line KR p (p * r4) d DoNothing
  return (out o (pan2 (sinOsc AR m 0) l e))

type R = Double

fm :: Transport m => R -> R -> R -> R -> R -> m ()
fm f ff a d i = do
  r1 <- rrand (-1) 1
  r2 <- rrand (-1) 1
  let p = [("freq", midiCPS f)
          ,("freq2", midiCPS ff + r1)
          ,("amp", a)
          ,("dur", d)
          ,("index", i)
          ,("pan", r2)]
  send (s_new "fm_kltr" (-1) AddToTail 1 p)

nd :: Transport m => m ()
nd = do
  ff <- rrand 48 96
  a <- rrand 0.1 0.4
  d <- rrand 1.2 7.2
  i <- rrand 240 1480
  t <- rrand 0.15 1.25
  fm 53 ff a d i
  pauseThread t

run :: (Transport m,UId m) => m ()
run = do
  u <- fm_kltr
  _ <- async (d_recv (synthdef "fm_kltr" u))
  sequence_ (replicate 32 nd)

main :: IO ()
main = withSC3 run
