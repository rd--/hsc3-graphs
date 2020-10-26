import Sound.SC3 {- hsc3 -}
import JMcC.SC2

main :: IO ()
main = audition (out 0 berlin_1977)

wr :: IO ()
wr = do
  let dir = "/home/rohan/sw/hsc3-graphs/scsyndef"
  synthdefWrite_dir dir (synthdef "berlin-1977.hs" (out 0 berlin_1977))
