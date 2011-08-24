-- noise modulated sines (jmcc)

import Sound.OpenSoundControl
import Sound.SC3.ID
import Sound.SC3.Lang.Events.OverlapTexture

nms :: UGen
nms =
    let f = midiCPS (rand 'a' 60 100)
        o = fSinOsc AR (mce2 f (f + 0.2)) 0
        a = lfNoise2 'b' KR (f * mce2 0.15 0.16) * 0.1
    in o * a

cmb :: Synthdef
cmb =
    let i = in' 2 AR 0
    in synthdef "cmb" (replaceOut 0 (combN i 0.3 0.3 4 + mceReverse i))

act :: Transport t => t -> IO ()
act fd = do
  _ <- async fd (d_recv cmb)
  send fd (g_new [(2,AddToTail,0)])
  send fd (s_new "cmb" (-1) AddToTail 2 [])
  play fd (overlapTextureU' (4,4,4,maxBound) nms)

main :: IO ()
main = withSC3 act
