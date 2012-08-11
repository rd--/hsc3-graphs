-- http://sccode.org/1-4QN

import Control.Concurrent {- base -}
import Control.Monad
import Sound.OSC {- hosc -}
import Sound.SC3.ID {- hsc3 -}
import Sound.SC3.Lang.Control.Event {- hsc3-lang -}
import Sound.SC3.Lang.Pattern.ID
import qualified Sound.SC3.Lang.Random.IO as L

-- > withSC3 init_b
init_b :: Transport m => m Message
init_b = do
  _ <- async (b_alloc 0 512 1)
  async (b_gen_sine1 0 [Normalise,Wavetable,Clear] (map recip [1,2,3,4]))

mk_g :: (Rate -> UGen -> UGen) -> Synthdef
mk_g o =
    let k = control KR
        b = k "bufnum" 0
        d = k "dur" 1
        r = k "rate" 1
        p = k "pos" 0
        sd = k "sdens" 1
        ed = k "edens" 1
        l = line KR sd ed d DoNothing
        t = o AR l
        e_p = envPerc (rand 'a' 0.0001 0.1) (d * rand 'a' 0.5 4)
        e = envGen KR 1 1 0 1 RemoveSynth e_p
        g = grainBuf 2 t (1 / l) b r p 2 0 (-1) 512
    in synthdef "g" (out 0 (g * e))

p1 :: P Event
p1 = pbind
    [("dur",pseq [4] inf)
    ,("sdens",pseq [9000,1000,500] inf / 100)
    ,("edens",prand 'a' [pseq [9000,1000,500] 1 / 10,pseq [1] 3] inf)
    ,("rate",pwhite 'b' (-10) 10 inf)
    ,("pos",pwhite 'c' (-10) 10 inf)]

p2 :: P Event
p2 = pbind
     [("dur",pseq [4/3] inf)
     ,("sdens",pseq [9000,1000,500,25] inf)
     ,("edens",prand 'a' [pseq [9000,1000,500,25] 1,pseq [1] 4] inf)
     ,("rate",pwhite 'b' (-100) 100 inf)
     ,("pos",pwhite 'c' (-10) 10 inf)]

push_g :: Transport m => m Message
push_g = do
  let ph u r f = u r f 0
      wd u r f = u r f 0 0
      o_set = [lfNoise0 'a',ph sinOsc,ph impulse,wd lfPulse,ph lfSaw]
  o <- L.choose o_set
  async (d_recv (mk_g o))

update_g :: Transport m => m ()
update_g = do
  _ <- push_g
  dt <- L.choose [1,2,4,8,16,32]
  pauseThread dt

main :: IO ()
main = do
  _ <- forkIO (withSC3 (reset >> init_b >> forever update_g))
  audition ("g",ppar [p1,p2])