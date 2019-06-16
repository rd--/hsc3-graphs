-- why supercollider (jmcc) #0

import qualified Sound.SC3 as SC3 {- hsc3 -}
import Sound.SC3.UGen.M {- hsc3-m -}
import Sound.SC3.Graphs.JMcC.Why_SuperCollider.M {- hsc3-graphs -}

main :: IO ()
main = audition_st why_supercollider

wr :: IO ()
wr = do
  let dir = "/home/rohan/sw/hsc3-graphs/scsyndef"
  SC3.synthdefWrite (synthdef "why-supercollider-m.hs" (out 0 why_supercollider)) dir
