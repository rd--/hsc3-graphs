-- http://www.fredrikolofsson.com/f0blog/?q=node/617 (f0)
import Sound.SC3 {- hsc3 -}
import Sound.SC3.Graphs.F0 {- hsc3-graphs -}
main :: IO ()
main = withSC3 (play (out 0 f0_tw0220))
