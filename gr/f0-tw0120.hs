-- http://sccode.org/1-4Qy (f0)
import Sound.SC3 {- hsc3 -}
import Sound.SC3.Graphs.F0 {- hsc3-graphs -}
main :: IO ()
main = audition (out 0 f0_tw0120)
