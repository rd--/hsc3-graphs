-- early space music LP, side 2 (jmcc)

import Sound.SC3.ID
import qualified Sound.SC3.Lang.Random.Gen as R
import Sound.SC3.Lang.Control.OverlapTexture
import qualified System.Random as R

m1 :: UGen
m1 =
    let a = rand 'a' 0 20
	b = rand 'b' 0 5000
	c = rand 'c' 0 20
	p = rand 'd' (-1) 1
    in pan2 (sinOsc AR (sinOsc AR a 0 * 0.1 * b + b) 0 * sinOsc KR c 0 * 0.08 + 0.08) p 1

m2 :: UGen
m2 =
    let a0 = rand 'a' 40 240
	a1 = a0 + (rand 'b' (-1) 1)
	a = mce2 a0 a1
	b = expRand 'c' 50 2400
	c = mce2 (a0 + rand 'd' (-1) 1) (a1 + rand 'e' (-1) 1)
    in sinOsc AR (sinOsc AR a 0 * rand 'f' 0 1 * b + b) 0 * sinOsc KR c 0 * 0.025 + 0.025

m3 :: UGen
m3 =
    let f = midiCPS (rand 'a' 60 100)
    in fSinOsc AR (mce2 f (f + 0.2)) 0 * lfNoise2 'b' KR (f * mce2 0.15 0.16) * 0.1

m4 :: UGen
m4 =
    let f = midiCPS (rand 'a' 24 96)
	r = xLine KR (expRand 'b' 0.1 20) (expRand 'c' 0.1 20) 25.6 DoNothing
        a = lfPulse KR (expRand 'd' 0.2 1.2) 0 (rand 'e' 0.1 0.2)
        o i = let e = max 0 (sinOsc KR (r * rand 'f' 0.9 1.1) (rand 'g' 0 (2 * pi)) * 0.1 - 0.05)
                  s = fSinOsc AR (f * i + f) 0 * e * (1 / (i + 1))
              in pan2 s (rand i (-1) 1) 1
    in mix (uprotect 'a' (map o [0..11])) * a

m6 :: UGen
m6 =
    let f = midiCPS (lfNoise1 'a' KR (rand 'b' 0 0.3) * 60 + 70)
        a0 = lfNoise2 'c' AR (f * rand 'd' 0 0.5)
        a1 = max 0 (lfNoise1 'e' KR (rand 'f' 0 8) * sinOsc KR (rand 'g' 0 40) 0 * 0.1)
	z = sinOsc AR f 0 * a0 * a1
    in pan2 z (lfNoise1 'h' KR (rand 'i' 0 5)) 1

enumFromN :: Enum a => a -> Int -> [Int]
enumFromN e i = let j = fromEnum e in [j .. j + i]

m7 :: UGen
m7 =
    let p = 15
        z = let y = let fr = map (\e -> expRand e 100 6000) (enumFromN 'a' p)
                        rt = map (\e -> rand e 2 6) (enumFromN 'a' p)
                    in klankSpec fr (replicate p 1) rt
            in upar 'a' 2 y
        f = xLine KR (expRand 'α' 40 300) (expRand 'β' 40 300) 12 DoNothing
        t = lfPulse AR f 0 (rand 'γ' 0.1 0.9) * 0.002 * max 0 (lfNoise2 'δ' KR (rand 'ε' 0 8))
    in distort (klank t 1 0 1 (mceTranspose z)) * 0.3

esmlp2 :: R.RandomGen g => g -> (UGen, g)
esmlp2 g = R.choose (map (* 0.3) [m1,m2,m3,m4,m6,m7]) g

esmlp2_pp :: UGen -> UGen
esmlp2_pp i =
    let c = combN i 0.3 (mce2 (rand 'a' 0.1 0.3) (rand 'a' 0.12 0.32)) 8
    in mix (upar 'a' 5 c) * 0.3

main :: IO ()
main = do
  let g = R.mkStdGen 0
  overlapTextureS_pp (2,4,6,maxBound) esmlp2 g 2 esmlp2_pp

{-
audition (out 0 (m6 * 0.5))
Sound.SC3.UGen.Dot.draw m7
-}
