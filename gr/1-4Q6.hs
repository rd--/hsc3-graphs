-- http://sccode.org/1-4Q6 (f0)
import Sound.SC3 {- hsc3 -}
import qualified Sound.SC3.Lang.Pattern.Plain as P {- hsc3-lang -}
import Sound.SC3.Graphs.F0 {- hsc3-graphs -}
main :: IO ()
main = nrt_audition (P.nbind1 risset_p)
