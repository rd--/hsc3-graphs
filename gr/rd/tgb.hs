-- tgb (rd, 2006-10-16)

import Sound.OSC {- hosc -}
import Sound.SC3 {- hsc3 -}

tgb_f :: UId m => UGen -> UGen -> m UGen
tgb_f b d = do
  let mkls bp t = envGen KR 1 1 0 1 RemoveSynth (envCoord bp t 1 EnvLin)
      pm_t l r du t = let le = mkls l du
                          re = mkls r du
                      in tRandM le re t
      pm_n rt l du = do let le = mkls l du
                            re = mkls l du
                        n <- whiteNoiseM rt
                        return (linLin_b n le re)
  gps <- pm_n AR [(0,400),(1,900)] d
  let t = impulse AR gps 0
      pm_f (l,r) = pm_t l r d t
  du <- pm_f ([(0,0.005),(0.5,0.015),(1,0.005)]
             ,[(0,0.009),(0.5,0.020),(1,0.009)])
  pn <- pm_f ([(0,-1.0),(0.5,-0.5),(1,0.5)]
             ,[(0,-0.5),(0.5,0.5),(1,1.0)])
  rt <- pm_f ([(0,6),(0.5,12),(1,6)]
             ,[(0,12),(0.5,12),(1,12)])
  cs <- pm_f ([(0,0),(1,0.95)]
             ,[(0,0),(1,1)])
  am <- pm_f ([(0,0.25),(0.5,0.55),(1,0.15)]
             ,[(0,0.5),(0.5,0.75),(1,0.25)])
  let cs' = cs * bufDur KR b
  return (tGrains 2 t b rt cs' du pn am 2)

tgb_10_12_m :: UId m => m UGen
tgb_10_12_m = tgb_f 10 12

tgb_10_12 :: UGen
tgb_10_12 = uid_st_eval tgb_10_12_m

act :: (UId m,Transport m) => (FilePath,Int,Int) -> m ()
act (fn,frame0,n_frames) = do
  _ <- async (b_allocRead 10 fn frame0 n_frames)
  play (out 0 tgb_10_12)

main :: IO ()
main = do
  let fn = "/home/rohan/data/audio/pf-c5.aif"
  withSC3 (act (fn,0,0))

{-
let fn = "/home/rohan/data/audio/instr/farfisa/aad/principale-8.flac"
withSC3 (act (fn,48000 * 9,48000 * 2))
-}
