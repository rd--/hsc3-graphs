-- https://www.listarc.bham.ac.uk/lists/sc-users/msg21360.html

import Sound.OSC {- hosc -}
import Sound.SC3 {- hsc3 -}

-- > withSC3 (reset >> init_b [0,1])
init_b :: Transport m => [Int] -> m ()
init_b b = do
  sr <- serverSampleRateNominal
  let f n = async (b_alloc n (floor sr) 1)
  mapM_ f b

-- > audition (m21360 (mce [0,1]))
m21360 :: UGen -> UGen
m21360 b =
    let del = mce [0.2,0.3,0.4,0.5] * rand 'α' 0.15 0.35
        loc = mce [-1,-0.7,0.6,1]
        hpp = mce [rand 'β' 300 600,rand 'γ' 900 1200]
        avg = mce [8000,14000]
        sdt = mce [300,400]
        lpp = mce [rand 'δ' 4300 4500,rand 'ε' 4000 4200]
        sr = sampleRate
        local = localIn' 2 AR
        wn = line KR 0 1 0.1 DoNothing * whiteNoise 'ζ' AR * 0.03
        ph = delTapWr AR b (wn + local)
        fb = delTapRd AR b ph del 1
        p_fb = mix (pan2 fb loc 1)
        h_fb = hpf p_fb hpp
        ao = averageOutput (abs h_fb) (impulse KR (recip (avg / sr)) 0)
        n_fb = h_fb * (0.02 / clip (lag ao (sdt / sr)) 0.0001 1)
        l_fb = lpf n_fb lpp
    in mrg [localOut l_fb,out 0 l_fb]

main :: IO ()
main = withSC3 (reset >> init_b [0,1] >> play (m21360 (mce [0,1])))
