-- berlin 1977 (jmcc) #4

import Sound.SC3 {- hsc3 -}
import Sound.SC3.Graphs.JMcC {- hsc3-graphs -}

main :: IO ()
main = audition (out 0 berlin_1977)

wr :: IO ()
wr = do
  let dir = "/home/rohan/sw/hsc3-graphs/scsyndef"
  synthdefWrite (synthdef "berlin-1977.hs" (out 0 berlin_1977)) dir
