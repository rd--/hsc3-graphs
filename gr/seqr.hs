-- seqr (rd)

import Sound.SC3.ID {- hsc3 -}
import Sound.SC3.UGen.External.RDU {- sc3-rdu -}

nrand :: ID z => Int -> z -> UGen -> UGen -> [UGen]
nrand n e l = mceChannels . randN n e l

nfreq :: ID a => a -> Int -> UGen -> UGen -> [UGen]
nfreq z n l r = map (midiCPS . floorE) (nrand n z l r)

seqr_f :: UGen -> [UGen] -> UGen
seqr_f f e =
    let n = constant (length e `div` 2)
    in select (lfSaw KR f 0 * n + n) (mce e)

seqr :: Int -> UGen
seqr n =
  let f = rand 'a' 9 18 / constant n
      b = blip AR (mce2 (seqr_f f (nfreq 'a' n 72 96))
                        (seqr_f f (nfreq 'b' n 72 84)))
                  (mce2 (seqr_f f (nrand n 'c' 1 3))
                        (seqr_f f (nrand n 'd' 3 6)))
      a = mce2 (seqr_f f (nrand n 'e' 0.05 0.10))
               (seqr_f f (nrand n 'f' 0.05 0.15))
  in b * a

-- n = rand 6 18
main :: IO ()
main = audition (out 0 (seqr 12))