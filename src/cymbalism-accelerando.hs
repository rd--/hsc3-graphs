-- cymbalism accellerando (jmcc)

import Sound.SC3.ID
import Sound.SC3.Lang.Events.OverlapTexture

enumFromN :: Enum a => a -> Int -> [Int]
enumFromN e i = let j = fromEnum e in [j .. j + i]

cymbalism_accellerando :: UGen
cymbalism_accellerando =
  let y n = let f1 = rand n 500 2500
                f2 = rand n 0 8000
                f = map (\e -> rand e f1 (f1 + f2)) (enumFromN n 15)
                rt = map (\e -> rand e 1 5) (enumFromN n 15)
          in klankSpec f (replicate 15 1) rt
      z = mce2 (y 'a') (y 'A')
      w = whiteNoise 'α' AR * 0.02
      tf = xLine KR (linRand 'β' 0.5 4.5 0) (rand 'γ' 0.5 35.5) 12 DoNothing
      t = impulse ar tf 0
      s = decay t 0.004 * w
  in klank s 1 0 1 (mceTranspose z)

main :: IO ()
main = overlapTextureU (4,4,4,maxBound) cymbalism_accellerando
