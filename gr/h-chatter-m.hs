-- h-chatter (rd)

import Sound.SC3 {- hsc3 -}

h_chatter :: UId m => m UGen
h_chatter = do
  let mma m a = return . (+ a)  . (* m)
      h0 = do n <- mma 5 5 =<< lfNoise0M KR 1
              a <- mma 0.2 1.2 =<< lfNoise2M KR n
              b <- mma 0.15 0.15 =<< lfNoise2M KR n
              let f = 40
                  h = henonN AR (mce2 f (f * 0.5)) a b 0 0
              return (saw AR (h * 3200 + 1600) * 0.35)
      h1 = do n0 <- lfNoise0M KR 32
              n1 <- lfNoise0M KR 2
              let a = mouseX KR 1.2 1.4 Linear 0.1
                  b = mouseY KR 0.2 0.3 Linear 0.1
                  h = linLin_b n0 1 32
                  p = linLin_b n1 2400 3200
                  l = linLin_b n1 (-0.75) 0.75
                  g = linLin_b n1 0.55 0.85
                  f = 40
                  o = blip AR (linLin_b (henonN AR f a b 0 0) p (p * 2)) h
              return (pan2 o l g * 0.35)
  h0 .+. h1

main :: IO ()
main = audition . out 0 =<< h_chatter
