-- http://sccode.org/1-1HR (f0)

import Control.Concurrent {- base -}

import Sound.SC3 {- hsc3 -}
import qualified Sound.SC3.Cairo.Scope.BD as BD {- hsc3-cairo -}
import qualified Sound.SC3.Cairo.Scope.Shell as Shell {- hsc3-cairo -}

instr :: UGen
instr =
    let x = mouseX KR 1 1000 Linear 0.2
        y = mouseY KR 50 5000 Linear 0.2
        v = varSaw AR x 0 0.5
        f = bpf v y 0.5
        s = sinOsc AR 0 f
        n = brownNoise 'α' AR * 0.1
    in out 0 (mce2 s n)

main :: IO ()
main = do
  audition instr
  _ <- forkIO (Shell.shell (BD.bd_shell 2) BD.bd_default)
  return ()

{-

let s = saw AR (mouseX KR 20 800 Exponential 0.2)
audition (out 0 s)

let v = varSaw AR (mouseX KR 1 1000 Linear 0.2) 0 0.5
let f = bpf v (mouseY KR 50 5000 Linear 0.2) 0.5
let s = sinOsc AR 0 f
audition (out 0 s)

th <- forkIO (Shell.shell (BD.bd_shell 1) BD.bd_default)
killThread th

-}
