-- strummable guitar (jmcc) #11
import Sound.SC3 {- hsc3 -}
import Sound.SC3.Graphs.JMcC {- hsc3-graphs -}
main :: IO ()
main = audition (out 0 str_gtr)
