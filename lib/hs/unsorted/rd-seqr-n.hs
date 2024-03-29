-- seqr-n (rd)

import Sound.SC3 {- hsc3 -}

import qualified Sound.SC3.Lang.Control.OverlapTexture as O {- hsc3-lang -}
import qualified Sound.SC3.UGen.Bindings.DB.RDU as RDU {- sc3-rdu -}

seqr_f :: UGen -> UGen -> UGen
seqr_f f e =
    let n = constant (mceDegree_err e) / 2
    in select (mulAdd (lfSaw KR f 0) n n) e

seqr_n :: Int -> UGen
seqr_n n =
  let f = iRand 'α' 9 18 / constant n
      o1 = let f1 = seqr_f f (midiCPS (RDU.iRandN n 'β' 72 96))
               f2 = seqr_f f (midiCPS (RDU.iRandN n 'γ' 72 84))
               h1 = seqr_f f (RDU.randN n 'δ' 1 3)
               h2 = seqr_f f (RDU.randN n 'ε' 3 6)
           in blip AR (mce2 f1 f2) (mce2 h1 h2)
      o2 = mce2 (seqr_f f (RDU.randN n 'ζ' 0.05 0.10)) (seqr_f f (RDU.randN n 'η' 0.05 0.15))
  in o1 * o2

main :: IO ()
main = O.overlapTextureU (6,6,3,maxBound) (seqr_n 13)
