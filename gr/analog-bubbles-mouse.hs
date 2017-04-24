-- analog bubbles with mouse control (jmcc) #3
import Sound.SC3 {- hsc3 -}
import Sound.SC3.Graphs.JMcC {- hsc3-graphs -}
main :: IO ()
main = audition (out 0 analog_bubbles_mouse)
