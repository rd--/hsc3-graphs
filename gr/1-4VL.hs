-- http://sccode.org/1-4VL

import Sound.SC3 {- hsc3 -}
import Sound.SC3.Lang.Control.OverlapTexture {- hsc3-lang -}
import qualified Sound.SC3.Lang.Random.ID as R {- hsc3-lang -}

tb_freq :: [UGen]
tb_freq =
    let n e z (l,r) = range l r (lfNoise1 e KR z)
        ln (s,e,d) = line KR s e d DoNothing
        f0 = n 'α' 0.5 (2424, 2444)
    in [f0 + ln (20, 0, 0.5)
       ,f0 + n 'β' 0.5 (1, 3)
       ,n 'γ' 1.5 (5435, 5440) - ln (35, 0, 1)
       ,n 'δ' 1.5 (5480, 5485) - ln (10, 0, 0.5)
       ,n 'ε' 2 (8435, 8445) + ln (15, 0, 0.05)
       ,n 'ζ' 2 (8665, 8670)
       ,n 'η' 2 (8704, 8709)
       ,n 'θ' 2 (8807, 8817)
       ,n 'ι' 2 (9570, 9607)
       ,n 'κ' 2 (10567, 10572) - ln (20, 0, 0.05)
       ,n 'λ' 2 (10627, 10636) + ln (35, 0, 0.05)
       ,n 'μ' 2 (14689, 14697) - ln (10, 0, 0.05)]

tb_amp :: [UGen]
tb_amp =
    let n e z (l,r) = range l r (lfNoise1 e KR z)
        a = [n 'α' 1 (-10, -5)
            ,n 'β' 1 (-20, -10)
            ,n 'γ' 1 (-12, -6)
            ,n 'δ' 1 (-12, -6)
            ,-20
            ,-20
            ,-20
            ,-25
            ,-10
            ,-20
            ,-20
            ,-25]
    in map dbAmp a

tb_rtime :: Floating b => b -> [b]
tb_rtime freqscale =
    let t = [20 * (freqscale ** 0.2)
            ,20 * (freqscale ** 0.2)
            ,5
            ,5
            ,0.6
            ,0.5
            ,0.3
            ,0.25
            ,0.4
            ,0.5
            ,0.4
            ,0.6]
    in map (* ((recip freqscale) ** 0.5)) t

prayer_bell :: UGen -> UGen -> UGen -> UGen -> DoneAction -> UGen
prayer_bell exc freq decayscale lagTime doneAction =
    let freqscale = lag3 (freq / 2434) lagTime
        decayscale' = lag3 decayscale lagTime
        spec = klankSpec tb_freq tb_amp (tb_rtime freqscale)
        sig = dynKlank exc freqscale 0 decayscale' spec
        end = detectSilence (mix sig) 1e-4 0.1 doneAction
    in mrg2 sig end

-- > audition (out 0 bell_1)
bell_1 :: UGen
bell_1 =
    let tr = impulse AR 0 0 * rand 'α' 0.05 0.09
        exc = tr + (pinkNoise 'β' AR * xLine KR 2e-3 1e-6 15 DoNothing)
        frq = lchoose 'γ' [120,240 .. 2000]
    in prayer_bell exc frq 1 0 RemoveSynth

-- > audition (out 0 bell_2)
bell_2 :: UGen
bell_2 =
    let exc = impulse AR 0 0 * rand 'α' 0.05 0.09
        frq = lchoose 'β' [240, 360 .. 2000]
    in prayer_bell exc frq 1 10 RemoveSynth

main :: IO ()
main = spawnTextureU (\i -> R.rrand i (1/3) 9,maxBound) (lchoose 'α' [bell_1,bell_2])
