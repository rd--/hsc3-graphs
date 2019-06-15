-- http://www.fredrikolofsson.com/f0blog/?q=node/490 (f0)
import Sound.SC3 {- hsc3 -}
import F0
main :: IO ()
main = audition (out 0 (pkt_07 6))
