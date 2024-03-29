-- fm-kltr (rd)

import Sound.OSC {- hosc -}
import Sound.SC3 {- hsc3 -}

import qualified Sound.SC3.Lang.Random.IO as R {- hsc3-lang -}

fm_kltr_m :: UId m => m UGen
fm_kltr_m = do
  r1 <- randM 0.975 1.025
  r2 <- randM 0.5 1.5
  r3 <- randM 0.975 1.025
  r4 <- randM 0.75 1.25
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

fm_kltr :: UGen
fm_kltr = uid_st_eval fm_kltr_m

type R = Double

fm :: Transport m => R -> R -> R -> R -> R -> m ()
fm f ff a d i = do
  r1 <- R.rrand (-1) 1
  r2 <- R.rrand (-1) 1
  let p = [("freq", midiCPS f)
          ,("freq2", midiCPS ff + r1)
          ,("amp", a)
          ,("dur", d)
          ,("index", i)
          ,("pan", r2)]
  sendMessage (s_new "fm_kltr" (-1) AddToTail 1 p)

nd :: Transport m => m ()
nd = do
  ff <- R.rrand 48 96
  a <- R.rrand 0.1 0.4
  d <- R.rrand 1.2 7.2
  i <- R.rrand 240 1480
  t <- R.rrand 0.15 1.25
  fm 53 ff a d i
  wait t

run :: (Transport m,UId m) => m ()
run = do
  u <- fm_kltr_m
  _ <- async (d_recv (synthdef "fm_kltr" u))
  sequence_ (replicate 32 nd)

main :: IO ()
main = withSC3 run
