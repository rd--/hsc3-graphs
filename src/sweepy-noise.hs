-- sweepy noise (jmcc)

import Sound.SC3.ID

sweepy_noise :: UGen
sweepy_noise =
    let n = uclone 'a' 2 (whiteNoise 'a' AR)
        lfoDepth = mouseY' KR 200 8000 Exponential 0.1
        lfoRate = mouseX' KR 4 60 Exponential 0.1
        freq = lfSaw KR lfoRate 0 * lfoDepth + (lfoDepth * 1.2)
        filtered = rlpf (n * 0.03) freq 0.1
    in combN filtered 0.3 0.3 2 + filtered

main :: IO ()
main = audition (out 0 sweepy_noise)
