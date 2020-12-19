-- ladspa ; caps ; # 1773 C* Eq10 - 10-band equaliser
let s = soundIn 0
    enumN n e = take n (enumFrom e)
    n = map (\z -> range (-24) 48 (lfNoise2 z KR 0.2)) (enumN 10 'α')
in X.ladspa 1 AR 1773 (n ++ [s]) * 0.1
