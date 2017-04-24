-- sample and hold liquidities (jmcc) #4
import Sound.SC3 {- hsc3 -}
import Sound.SC3.Graphs.JMcC {- hsc3-graphs -}
main :: IO ()
main = audition (out 0 sample_and_hold_liquidities)
