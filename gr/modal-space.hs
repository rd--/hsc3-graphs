-- modal space, using local buffer (jmcc) #8
import Sound.SC3 {- hsc3 -}
import Sound.SC3.Graphs.JMcC {- hsc3-graphs -}
main :: IO ()
main = audition (out 0 modal_space)
