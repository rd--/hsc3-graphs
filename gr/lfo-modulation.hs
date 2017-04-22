-- lfo modulation (jmcc) #1
import Sound.SC3.Graphs.JMcC {- hsc3-graphs -}
import Sound.SC3 {- hsc3 -}
main :: IO ()
main = audition (out 0 lfo_modulation)
