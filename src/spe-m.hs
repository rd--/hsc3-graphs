-- spe (jmcc)
-- variant of graph in streams & patterns tutorial

import Sound.SC3.Monadic

spe :: UId m => m UGen
spe = do
  let (>=>) f g x = f x >>= g
      chain n f = foldl (>=>) return (replicate n f)
      rapf i = do r <- clone 2 (rand 0 0.05)
                  return (allpassN i 0.05 r 4)
      src = do let t = impulse KR 9 0
                   e = envGen KR t 0.1 0 1 DoNothing (envPerc 0.1 1)
                   s = mce [00,03,02,07
                           ,08,32,16,18
                           ,00,12,24,32]
               n <- lfNoise1 KR 1
               m <- dseq dinf s
               let f = midiCPS (demand t 0 m + 32)
                   o = lfSaw AR f 0 * e
                   rq = midiCPS (n * 36 + 110)
               return (rlpf o rq 0.1)
  chain 4 rapf =<< src

main :: IO ()
main = audition . (out 0) =<< spe