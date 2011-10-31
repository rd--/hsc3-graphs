-- hh-808 (ryan at wabdo.com)
-- http://www.create.ucsb.edu/pipermail/sc-users/2007-August/036131.html

import Sound.SC3

hh_808 :: UGen
hh_808 =
  let time = 250
      fr = [205.35,304.41,369.64,522.71,540.54,812.21]
      pulseEnv = let e = env [1.0,0.6] [time] [EnvNum (-0.5)] 0 0
                 in envGen AR 1 1 0 (1/1000) DoNothing e
      s = mix (lfPulse AR (mce (map (* 4.09) fr)) 0 0.5)
      f = [\a -> ((a ==* 6.0) * 0.6) +
                 ((a ==* 2.0) * 0.2) +
                 ((a ==* 1.0) * 0.9)
          ,\a -> (a * pulseEnv) + (mix (lfPulse AR (mce fr) 0 0.55)) * 0.9
          ,\a -> rlpf a 7000 0.6
          ,\a -> rhpf a 6800 1.5
          ,\a -> rhpf a 6800 1.5
          ,\a -> rhpf a 1200 1.5
          ,\a -> a + freeVerb a 0.33 0.5 0.5
          ,\a -> let c = map EnvNum [0,-0.5,0,-50]
                     e = env [0,1,0.4,0,0] [2,time,50,500] c 0 0
                 in a * envGen AR 1 1 0 (1/1000) RemoveSynth e
          ,\a -> mce [a,delayN a 0.005 0.005]]
  in foldl1 (flip (.)) f s * 2

main :: IO ()
main = audition (out 0 hh_808)

