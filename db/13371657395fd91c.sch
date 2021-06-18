-- reverberated sine percussion (jmcc) #3
let d = 6
    rdst _ = resonz (dust (2 / d) * 50) (200 + rand 0 3000) 0.003
    rapf i = allpassn i 0.05 (rrandn 2 0 0.05) 1
    z = delayn (mixfill d rdst) 0.048 0.48
    y = mix (combl z 0.1 (cr (lfnoise1 (rrandn 5 0 0.1)) * 0.04 + 0.05) 15)
    x = iter 4 rapf y
in z + x * 0.2
