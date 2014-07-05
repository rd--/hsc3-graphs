-- http://sccode.org/1-1Ni

import Control.Concurrent {- base -}
import Control.Monad {- base -}
import Sound.OSC {- hosc -}
import Sound.SC3.ID {- hsc3 -}

scr :: (UGen -> (UGen,UGen)) -> Int -> UGen -> UGen -> UGen
scr h n f d =
    let (h0,h1) = h f
        o z = sinOsc AR (expRand z h0 h1) 0 * 0.2
        m = mce (map o (take n ['α'..]))
        e = lfGauss AR d (1/4) 0 NoLoop RemoveSynth
    in splay (m * e) 1 0.25 0 True

-- > audition (b 12)
-- > Sound.SC3.UGen.Dot.draw (b 8)
b :: Int -> Synthdef
b np =
    let f = midiCPS (lchoose 'β' [40,45,52])
        h n = (n,n + (n / 64))
    in synthdef "b" (out 0 (scr h np f 9))

-- > audition (c 12)
c :: Int -> Synthdef
c np =
    let f = midiCPS (choose 'γ' (in' 3 KR 0))
        h n = (n - (n / 128),n + (n / 128))
    in synthdef "c" (out 0 (scr h np f 6))

-- > withSC3 (\fd -> send fd (c_setn [(0,x!!0)]))
x :: Num a => [[a]]
x = [[72,69,64],[70,64,62],[67,60,70],[65,60,69],[64,60,67],[65,60,69]]

-- > t <- begin 7
-- > mapM_ killThread t
begin :: Int -> IO [ThreadId]
begin n = do
  t0 <- forkIO (forever (audition (b n) >> wait 4))
  t1 <- forkIO (let set f = withSC3 (send (c_setn [(0,f)]))
                in mapM_ (\f -> set f >> wait 10) (cycle x))
  t2 <- forkIO (wait 0.1 >> forever (audition (c n) >> wait 0.5))
  return [t0,t1,t2]

main :: IO ()
main = begin 8 >> return ()
