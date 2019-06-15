import Sound.SC3 {- hsc3 -}
import JMcC.SC2

main :: IO ()
main = audition (out 0 analog_bubbles)

wr :: IO ()
wr = do
  let dir = "/home/rohan/sw/hsc3-graphs/scsyndef"
  synthdefWrite_dir dir (synthdef "analog-bubbles.hs" (out 0 analog_bubbles))

{-

> putStrLn $ synthstat analog_bubbles
> let g = synthdef_to_graphdef (synthdef "analog-bubbles" (out 0 analog_bubbles))
> import qualified Sound.SC3.Server.Graphdef as Graphdef
> putStrLn $ Graphdef.graphdef_stat g

-}
