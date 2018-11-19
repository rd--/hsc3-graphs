-- analog bubbles (jmcc) #1

import Sound.SC3 {- hsc3 -}
import Sound.SC3.Graphs.JMcC {- hsc3-graphs -}

main :: IO ()
main = audition (out 0 analog_bubbles)

wr :: IO ()
wr = do
  let dir = "/home/rohan/sw/hsc3-graphs/scsyndef"
  synthdefWrite (synthdef "analog-bubbles.hs" (out 0 analog_bubbles)) dir
