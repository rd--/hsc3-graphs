-- adso (rd)

import Sound.OSC {- hosc -}
import Sound.SC3 {- hsc3 -}
import Sound.SC3.Lang.Random.IO {- hsc3-lang -}

getb :: Real a => UGen -> a -> UGen
getb b j =
    let k = mce [0 .. constant j - 1]
    in bufRdN 1 KR b k NoLoop

adso :: Real a => a -> UGen
adso n =
    let m = sinOsc KR (getb 3 n) 0
        f = midiCPS (getb 0 n) * (m * getb 4 n + 1)
        l = getb 2 n
        g = getb 1 n
    in mix (pan2 (sinOsc AR f 0) l g)

pattern :: Transport m => Int -> Double -> m ()
pattern n t = do
  z <- do l <- rrand 22 48
          r <- rrand 54 122
          sequence (replicate n (rrand l r))
  sendMessage (b_setn1 0 0 z)
  let rn i l r = do d <- nrrand n l r
                    sendMessage (b_setn1 i 0 d)
  rn 1 0 0.1
  rn 2 (-1) 1
  rn 3 2 12
  rn 4 0.001 0.0075
  rn 5 1 24
  rn 6 0.05 2.4
  pauseThread t

run :: Transport m => Int -> m ()
run n = do
  mapM_ (\i -> async (b_alloc i n 1)) [0..6]
  _ <- play (out 0 (adso n))
  mapM_ (pattern n) =<< nrrand 32 0.025 0.75
  reset

main :: IO ()
main = withSC3 (run 24)
