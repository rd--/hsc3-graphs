-- analog bubbles (jmcc) #1

import Sound.SC3 {- hsc3 -}

analog_bubbles :: UGen
analog_bubbles =
  let o = lfSaw KR (mce2 8 7.23) 0 * 3 + 80
      f = lfSaw KR 0.4 0 * 24 + o
      s = sinOsc AR (midiCPS f) 0 * 0.04
  in combN s 0.2 0.2 4

main :: IO ()
main = audition (out 0 analog_bubbles)

{-

> putStrLn$synthstat analog_bubbles
> let g = synthdef_to_graphdef (synthdef "analog-bubbles" (out 0 analog_bubbles))
> import qualified Sound.SC3.Server.Graphdef as G
> putStrLn$G.graphdef_stat g

> let dir = "/home/rohan/sw/hsc3-graphs/scsyndef"
> synthdefWrite (synthdef "analog_bubbles" (out 0 analog_bubbles)) dir

-}
