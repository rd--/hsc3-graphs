-- https://mohayonao.github.io/CoffeeCollider/#mouse.coffee

import Sound.SC3 {- hsc3 -}

mouse :: UGen
mouse =
    let freq = mouseY KR 100 1000 Exponential 0.1
        freq1 = freq * mouseX KR 2 0.5 Linear 2.5
        freq2 = freq * mouseX KR 0.5 2 Linear 2.5
        feedback = mouseButton KR 0 pi 5
    in sinOscFB AR (mce2 freq1 freq2) feedback * 0.25

main :: IO ()
main = audition (out 0 mouse)
