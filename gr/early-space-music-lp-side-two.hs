-- early space music LP, side 2 (jmcc)

import Sound.SC3.ID {- hsc3 -}
import qualified Sound.SC3.Lang.Random.Gen as R {- hsc3-lang -}
import Sound.SC3.Lang.Control.OverlapTexture
import Sound.SC3.UGen.External.RDU {- sc3-rdu -}
import qualified System.Random as R {- random -}

m1 :: UGen
m1 =
    let a = rand 'α' 0 20
        b = rand 'β' 0 5000
        c = rand 'γ' 0 20
        p = rand 'δ' (-1) 1
    in pan2 (sinOsc AR (sinOsc AR a 0 * 0.1 * b + b) 0 * sinOsc KR c 0 * 0.08 + 0.08) p 1

m2 :: UGen
m2 =
    let a0 = rand 'ε' 40 240
        a1 = a0 + rand 'ζ' (-1) 1
        a = mce2 a0 a1
        b = expRand 'η' 50 2400
        c = mce2 (a0 + rand 'θ' (-1) 1) (a1 + rand 'ι' (-1) 1)
    in sinOsc AR (sinOsc AR a 0 * rand 'κ' 0 1 * b + b) 0 * sinOsc KR c 0 * 0.025 + 0.025

m3 :: UGen
m3 =
    let f = midiCPS (rand 'λ' 60 100)
    in fSinOsc AR (mce2 f (f + 0.2)) 0 * lfNoise2 'μ' KR (f * mce2 0.15 0.16) * 0.1

-- audition (out 0 m4)
m4 :: UGen
m4 =
    let a = lfPulse KR (expRand 'ν' 0.2 1.2) 0 (rand 'ξ' 0.1 0.2)
        o i = let r = let (p,q) = mce2c (expRandN 2 i 0.1 20)
                      in xLine KR p q 25.6 DoNothing
                  f = midiCPS (rand i 24 96)
                  e = max 0 (sinOsc KR (r * rand i 0.9 1.1) (rand i 0 (2 * pi)) * 0.1 - 0.05)
                  s = fSinOsc AR (f * i + f) 0 * e * (1 / (i + 1))
              in pan2 s (rand i (-1) 1) 1
    in sum (map o [0..11]) * a

-- audition (out 0 (m6 * 0.5))
m6 :: UGen
m6 =
    let f = midiCPS (lfNoise1 'ο' KR (rand 'π' 0 0.3) * 60 + 70)
        a0 = lfNoise2 'ρ' AR (f * rand 'σ' 0 0.5)
        a1 = max 0 (lfNoise1 'τ' KR (rand 'υ' 0 8) * sinOsc KR (rand 'φ' 0 40) 0 * 0.1)
        z = sinOsc AR f 0 * a0 * a1
    in pan2 z (lfNoise1 'χ' KR (rand 'ψ' 0 5)) 1

enumFromN :: Enum a => a -> Int -> [Int]
enumFromN e i = let j = fromEnum e in [j .. j + i]

-- audition (out 0 m7)
-- Sound.SC3.UGen.Dot.draw m7
m7 :: UGen
m7 =
    let p = 15
        k = let y z = let fr = mceChannels (expRandN p z 100 6000)
                          rt = mceChannels (randN p z 2 6)
                      in klankSpec fr (replicate p 1) rt
            in mce2 (y 'ω') (y 'Α')
        f = xLine KR (expRand 'Β' 40 300) (expRand 'Γ' 40 300) 12 DoNothing
        t = lfPulse AR f 0 (rand 'Δ' 0.1 0.9) * 0.002 * max 0 (lfNoise2 'Ε' KR (rand 'Ζ' 0 8))
    in distort (klank t 1 0 1 (mceTranspose k)) * 0.3

esmlp2 :: R.RandomGen g => g -> (UGen, g)
esmlp2 = R.choose (map (* 0.3) [m1,m2,m3,m4,m6,m7])

-- Sound.SC3.UGen.Dot.draw (esmlp2_pp (sinOsc AR 440 0))
esmlp2_pp :: UGen -> UGen
esmlp2_pp i =
    let c z = combN i 0.3 (mce2 (rand z 0.1 0.3) (rand z 0.12 0.32)) 8
    in sum (map c ['Η'..'Θ']) * 0.3

main :: IO ()
main = do
  let g = R.mkStdGen 0
  overlapTextureS_pp (4,2,6,maxBound) esmlp2 g 2 esmlp2_pp
