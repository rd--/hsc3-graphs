-- tremulate (jmcc)

import Sound.OpenSoundControl
import Sound.SC3.ID
import Sound.SC3.Lang.Events.OverlapTexture

tremulate :: UGen
tremulate =
    let f = rand 'a' 500 900
        r = rand 'b' 30 90
        o = fSinOsc AR (f * mce [1,1.2,1.5,1.8]) 0
        a = max 0 (replicant 4 (lfNoise2 'c' KR r) * 0.1)
        l = let n e = rand e (-1) 1 in mce (map n "ghij")
    in mix (pan2 o l a)

{-
Sound.SC3.UGen.Dot.draw tremulate
-}

cmb :: Synthdef
cmb = synthdef "cmb" (replaceOut 0 (combN (in' 2 AR 0) 0.1 0.1 1))

act :: Transport t => t -> IO ()
act fd = do
  _ <- async fd (d_recv cmb)
  send fd (g_new [(2,AddToTail,0)])
  send fd (s_new "cmb" (-1) AddToTail 2 [])
  play fd (xfadeTextureU' (2,0.5,maxBound) tremulate)

main :: IO ()
main = withSC3 act

{-
play({CombN.ar(XFadeTexture.ar({
f = 500 + 400.rand;
r = 30 + 60.rand;
o = FSinOsc.ar(f*[1.0,1.2,1.5,1.8]);
a = max(0,LFNoise2.kr([r,r,r,r],0.1));
l = [1.0.rand2,1.0.rand2,1.0.rand2,1.0.rand2];
Mix.ar(Pan2.ar(o*a,l))},2,0.5,2),0.1,0.1,1)})
-}
