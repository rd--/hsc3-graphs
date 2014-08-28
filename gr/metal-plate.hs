-- metal plate (jmcc) #4

import Sound.SC3 {- hsc3 -}

mp :: UGen
mp =
    let
        sr = 48000
        -- number of delay lines
        n = 4
        -- maximum delay time
        maxdt = ceiling (sr * 0.03)
        -- allocate buffers for delay lines
        buf = map (\k -> asLocalBuf k (replicate maxdt 0)) [0 .. n - 1]
        -- assign random tap times
        tap_tm = uclone' 'a' n (rand 'a' 0.015 0.03)
        -- excitation
        exc_freq = mouseY KR 10 8000 Linear 0.2
        exc_trig = impulse AR 0.5 0 * 0.2
        exc = decay2 exc_trig 0.01 0.2 * lfNoise2 'a' AR exc_freq
        -- tap the delay lines
        del = zipWith (tap 1) buf tap_tm
        -- filter the taps
        flt_freq = mouseX KR 10 5000 Linear 0.2
        flt = map (\i -> lpf i flt_freq * 0.98) del
        -- write to delay lines
        wr = zipWith (\b f -> recordBuf AR b 0 1 0 1 Loop 1 DoNothing (f + exc)) buf flt
    in mrg (sum flt : wr)

main :: IO ()
main = audition (out 0 mp)
