-- sample and hold liquidities (jmcc) #4

import Sound.SC3.UGen.Record.CRU {- hsc3-rec -}

-- > draw shl
shl :: UGen
shl =
    let r = MouseX KR 1 200 Exponential 0.1
        t = recip r
        c = Impulse KR r 0 * 0.4
        cf = MouseY KR 100 8000 Exponential 0.1
        f = Latch (WhiteNoise 'α' KR * cf * 0.5 + cf) c
        p = Latch (WhiteNoise 'β' KR) c
        i = Pan2 (SinOsc AR f 0 * Decay2 c (t * 0.1) (t * 0.9)) p 1
    in CombN i 0.3 0.3 2

main :: IO ()
main = audition (Out 0 shl)
