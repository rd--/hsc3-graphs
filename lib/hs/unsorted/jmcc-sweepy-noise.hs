-- sweepy noise (jmcc) #6
import Sound.SC3 {- hsc3 -}
import Sound.SC3.Graphs.JMcC {- hsc3-graphs -}
main :: IO ()
main = audition (out 0 sweepy_noise)
