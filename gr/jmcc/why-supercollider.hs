import Sound.SC3 {- hsc3 -}
import JMcC.SC2

main :: IO ()
main = audition (out 0 why_supercollider)

wr :: IO ()
wr = do
  let dir = "/home/rohan/sw/hsc3-graphs/scsyndef"
  synthdefWrite_dir dir (synthdef "why-supercollider.hs" (out 0 why_supercollider))

-- > synthstat_wr why_supercollider
