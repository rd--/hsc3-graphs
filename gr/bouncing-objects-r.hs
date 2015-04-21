-- bouncing objects (jmcc) #2

import Sound.SC3.UGen.Record.CRU {- hsc3-rec -}

import Sound.SC3.Lang.Control.OverlapTexture {- hsc3-lang -}
import qualified Sound.SC3.Lang.Random.ID as R {- hsc3-lang -}

-- > draw bouncing_objects
-- > audition bouncing_objects
bouncing_objects :: UGen
bouncing_objects =
  let imp_frq = XLine KR (5 + Rand 'α' (-2) 2) 600 4 DoNothing
      imp_amp = XLine KR 0.09 0.000009 4 DoNothing
      imp = Impulse AR imp_frq 0 * imp_amp
      exc = Decay imp 0.001
      flt_frq = RandN 4 'β' 400 8400
      flt_amp = RandN 4 'γ' 0 1
      flt_rtm = RandN 4 'δ' 0.01 0.11
      flt = Klank exc 1 0 1 (klankSpec_mce flt_frq flt_amp flt_rtm)
      loc = Pan2 flt (Rand 'ε' (-1) 1) 1
      e = Envelope [1,1,0] [3,0.001] (replicate 2 EnvLin) Nothing Nothing
  in loc * envGen {rate = KR, doneAction = RemoveSynth, envelope_ = e}

main :: IO ()
main = spawnTextureU (\i -> R.rrand i 0.6 1.6,maxBound) (ugen bouncing_objects)
