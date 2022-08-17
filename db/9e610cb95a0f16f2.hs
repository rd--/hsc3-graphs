-- pluck ; https://scsynth.org/t/4318/17
let tr = impulse ar (lfNoise2 kr 1 `in_exprange` (1,100)) 0
    frq = map (midiCps . (+ 60.5)) [0, 2, 4, 5, 7, 9, 10]
    dlt = 1 / mce frq
    dct = mouseX kr 0.5 2 Linear 0.2
    sig = mix (leakDC (pluck (hasher (sweep ar tr 1) * dbAmp (-10)) tr dlt dlt dct 0.5) 0.995)
in pan2 (moogFF sig (lfNoise2 kr 1 `in_exprange` (500,16000)) 0 0) 0 1
