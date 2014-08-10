-- bouncing objects (jmcc) #2

import Sound.SC3 {- hsc3 -}
import Sound.SC3.Lang.Control.OverlapTexture {- hsc3-lang -}
import qualified Sound.SC3.Lang.Random.ID as R {- hsc3-lang -}
import Sound.SC3.UGen.External.RDU {- sc3-rdu -}

bouncing_objects :: UGen
bouncing_objects =
  let imp_frq = xLine KR (5 + rand 'α' (-2) 2) 600 4 DoNothing
      imp_amp = xLine KR 0.09 0.000009 4 DoNothing
      imp = impulse AR imp_frq 0 * imp_amp
      exc = decay imp 0.001
      flt_frq = randN 4 'β' 400 8400
      flt_amp = randN 4 'γ' 0 1
      flt_rtm = randN 4 'δ' 0.01 0.11
      flt = klank exc 1 0 1 (klankSpec_mce flt_frq flt_amp flt_rtm)
      loc = pan2 flt (rand 'ε' (-1) 1) 1
      e = Envelope [1,1,0] [3,0.001] (replicate 2 EnvLin) Nothing Nothing
  in loc * envGen KR 1 1 0 1 RemoveSynth e

main :: IO ()
main = spawnTextureU (\i -> R.rrand i 0.6 1.6,maxBound) bouncing_objects
