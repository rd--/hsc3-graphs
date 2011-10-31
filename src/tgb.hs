-- tgb (rd)

import Sound.OpenSoundControl
import Sound.SC3.Monadic

tgb :: UId m => UGen -> UGen -> m UGen
tgb b d = do
  let mkls bp t = envGen KR 1 1 0 1 RemoveSynth (envCoord bp t 1 EnvLin)
      pm_t l r du t = let le = mkls l du
                          re = mkls r du
                      in tRand le re t
      wrp i = linLin i (-1) 1
      pm_n rt l du = do let le = mkls l du
                            re = mkls l du
                        n <- whiteNoise rt
                        return (wrp n le re)
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

act :: Transport t => t -> IO ()
act fd = do
  let fn = "/home/rohan/data/audio/pf-c5.aif"
  _ <- async fd (b_allocRead 10 fn 0 0)
  play fd . out 0 =<< tgb 10 12

main :: IO ()
main = withSC3 act
