-- swept resonant noise (jmcc) #2

import Sound.SC3 {- hsc3 -}
import Sound.SC3.UGen.External.RDU {- sc3-rdu -}
import Sound.SC3.Lang.Control.OverlapTexture {- hsc3-lang -}

srn :: UGen
srn =
  let p = 10
      n = whiteNoise 'α' AR * 0.007
      f = midiCPS (fSinOsc KR (rand 'β' 0.1 0.3) 0 * rand 'γ' 0 24 + rand 'δ' 36 84)
      sw = resonz n f 0.1
      spec = klankSpec_mce
             (linRandN p 'ε' 80 10080 0)
             (mce (replicate p 1))
             (randN p 'ζ' 0.5 2.5)
  in uclone 'η' 2 (klank sw 1 0 1 spec)

main :: IO ()
main = overlapTextureU (4,4,5,maxBound) srn
