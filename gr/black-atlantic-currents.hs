-- http://www.listarc.bham.ac.uk/lists/sc-users/msg08240.html (jrhb)

import Data.Numbers.Primes {- primes -}
import System.Random {- random -}
import System.Random.Shuffle {- random-shuffle -}

import Sound.SC3.ID {- hsc3 -}

nth_prime :: Integral a => Int -> a
nth_prime j = primes !! j

chain :: Int -> (t -> t) -> t -> t
chain j f x = if j == 0 then x else chain (j - 1) f (f x)

xn,yn,zn :: Num a => a
xn = 64
yn = 65
zn = 66

type NF t a = a -> Rate -> t -> UGen

n :: NF t a -> t -> [a] -> UGen
n g f = mce . map (\k -> g k KR f)

n' :: NF t a -> [t] -> [a] -> UGen
n' g f = mce . map (\(f',k) -> g k KR f') . zip f

i :: UGen -> UGen
i = inFeedback 2

c :: Int -> UGen
c = constant

bac :: UGen
bac =
  let x = let ph = i yn * uclone 'α' 2 (lfdNoise3 'β' KR 1)
          in out xn (mceReverse (sinOsc AR (60 * 2) ph))
      y = let ph = i xn * uclone 'γ' 2 (lfdNoise3 'δ' KR 0.3) * 4
          in out yn (sinOsc AR (50 * 2) ph)
  in mrg [inFeedback 2 xn,y,x]

main :: IO ()
main = audition (out 0 bac)

bac' :: UGen
bac' =
  let x = let f = c (nth_prime 23)
              ph = i yn * uclone 'ε' 2 (lfdNoise3 'ζ' KR (sqrt 2))
          in out xn (mceReverse (sinOsc AR f ph))
      y = let f = c (chain 3 nth_prime 1)
              ph = i xn * uclone 'η' 2 (lfdNoise3 'θ' KR (sqrt pi)) * pi
          in out yn (tanh (sinOsc AR f ph))
  in mrg [inFeedback 2 xn,y,x]

bac'' :: UGen
bac'' =
  let x = let f = c (nth_prime 23)
              ph = i yn * n' lfdNoise3 (map sqrt [1,2]) "ab"
          in out xn (mceReverse (sinOsc AR f ph))
      y = let f = c (chain 3 nth_prime 1)
              ph = i xn * n lfdNoise1 (sqrt pi) "cd" * pi
          in out yn (tanh (sinOsc AR f ph))
      z = let f = c (chain 3 nth_prime 2)
              ph = i yn * n lfdNoise0 (sqrt (sqrt pi)) "ef" * 42 * pi
          in out zn (tanh (sinOsc AR f ph) * exp (-0.5 * pi))
  in mrg [inFeedback 2 xn,y,x,z]

bac''' :: UGen
bac''' =
  let x = let j = range 1 30 (lfNoise0 'ι' KR (log 2 / 2))
              f = select j (mce (map (c . nth_prime) [1..30]))
              ph = i zn * n' lfdNoise3 (map sqrt [1,2]) "ab"
          in out xn (mceReverse (sinOsc AR f ph))
      y = let f = c (chain 3 nth_prime 1)
              ph = i xn * n lfdNoise1 (sqrt pi) "cd" * pi
          in out yn (tanh (sinOsc AR f ph) * exp 1)
      z = let f = c (chain 3 nth_prime 2)
              ph = i yn * n lfdNoise0 (sqrt (sqrt pi)) "ef" * 42 * pi
          in out zn (tanh (sinOsc AR f ph) * exp (-0.5 * pi))
  in mrg [inFeedback 2 xn,y,x,z]

scramble :: Enum a => a -> [t] -> [t]
scramble j k =
    let g = mkStdGen (fromEnum j)
    in shuffle' k (length k) g

bac'''' :: UGen
bac'''' =
  let x = let j = range 1 30 (lfNoise2 'κ' KR (log 2 / 2))
              ph = i zn * n' lfdNoise3 (map sqrt [1,2]) "ab"
              f' = map (c . nth_prime) (scramble 'λ' [1,3..61])
              o = map (\f -> mceReverse (sinOsc AR f ph)) f'
          in out xn (mceChannel 1 (selectX j (mce o)))
      y = let f = c (chain 3 nth_prime 1)
              ph = i xn * n lfdNoise1 (sqrt pi) "cd" * pi
          in out yn (tanh (sinOsc AR f ph) * exp 1)
      z = let f = c (chain 3 nth_prime 2)
              ph = i yn * n lfdNoise0 (sqrt (sqrt pi)) "ef" * 42 * pi
          in out zn (tanh (sinOsc AR f ph) * exp (-0.5 * pi))
  in mrg [inFeedback 2 xn,y,x,z]

{-
audition (out 0 bac)
audition (out 0 bac')
audition (out 0 bac'')
audition (out 0 bac''')
audition (out 0 bac'''')
-}
