-- http://sccode.org/1-4QM

import Control.Monad {- base -}
import Sound.OSC {- hosc -}
import Sound.SC3.ID {- hsc3 -}
import qualified Sound.SC3.Lang.Random.IO as L {- hsc3-lang -}
import Sound.SC3.UGen.External.RDU {- sc3-rdu -}

type ST = (UGen,UGen,UGen)

n1 :: ST -> UGen -> UGen
n1 (s1,s2,s3) a =
    let x = tScramble 'α' KR 1 (mce [60,67,75,79,94])
        rel = choose 'β' (mce [0,0,0,0,0,0,0,1])
        p = envPerc 0.01 (a + rel)
        e = envGen AR 1 1 0 1 RemoveSynth p
        ta = midiCPS x * a * choose 'γ' s1
        tb = x * midiCPS (choose 'δ' s2)
        tc = a * midiCPS (choose 'ε' s3)
    in out 0 (e * ay ta tb tc 0.25 3 15 10 7 4 1 0)

mk_e :: UGen -> UGen -> UGen
mk_e m k =
    let g = let d = dseq 'ζ' dinf m
                l = dxrand 'η' dinf (mce2 0 1)
            in (duty KR d 0 DoNothing l)
        p = envPerc 0.01 k
    in envGen AR g 1 0 1 RemoveSynth p

n2 :: UGen -> UGen
n2 a =
  let n z = brownNoise z AR
      e = mk_e (mce2 0.5 0.25) (a / 2)
  in out 0 (e * mce2 (n 'θ') (n 'ι') * 0.6)

n3 :: UGen -> UGen
n3 a =
  let n z = whiteNoise z AR
      e = mk_e (mce2 0.25 0.5) (a / 4)
  in out 0 (e * lfNoise0 'κ' KR 16 * mce2 (n 'λ') (n 'μ'))

c1_4QM :: Transport m => ST -> m ()
c1_4QM st = do
  dt <- L.choose [0.125,0.25,0.5,0.5,0.25,0.125,1]
  let a = constant dt
  play (n1 st a)
  play (n2 a)
  play (n3 a)
  liftIO (wait dt)

main :: IO ()
main = do
  let s1 = [8,12,16,20]
  s2 <- L.scramble s1
  s3 <- L.scramble s1
  withSC3 (forever (c1_4QM (mce s1,2 / mce s2,2 * mce s3)))
