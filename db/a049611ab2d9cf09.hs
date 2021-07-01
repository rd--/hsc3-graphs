-- metal plate (jmcc) #4
let
    sr = 48000
    n = 4 {- number of delay lines -}
    maxdt = ceiling (sr * 0.03) {- maximum delay time -}
    buf = mceFill n (\_ -> clearBuf (localBuf 1 maxdt)) {- buffers for delay lines -}
    tap_tm = mceFill n (\_ -> rand 0.015 0.03) {- random tap times -}
    exc_freq = mouseY kr 10 8000 Linear 0.2
    exc_trig = impulse ar 0.5 0 * 0.2
    exc = decay2 exc_trig 0.01 0.2 * lfNoise2 ar exc_freq {- excitation -}
    del = tap 1 ar buf tap_tm {- delay line taps -}
    flt_freq = mouseX kr 10 5000 Linear 0.2
    flt = lpf del flt_freq * 0.98 {- tap filters -}
    wr = recordBuf ar buf 0 1 0 1 Loop 1 DoNothing (mce1 (flt + exc)) {- write to delay lines -}
in mrg2 (mix flt) wr
