-- why supercollider (jmcc) #0

import Sound.SC3 {- hsc3 -}
import Sound.SC3.Graphs.JMcC {- hsc3-graphs -}

main :: IO ()
main = audition (out 0 why_supercollider)

wr :: IO ()
wr = do
  let dir = "/home/rohan/sw/hsc3-graphs/scsyndef"
  synthdefWrite (synthdef "why-supercollider.hs" (out 0 why_supercollider)) dir
