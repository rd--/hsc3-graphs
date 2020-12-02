-- zitaRev ; longer
let i = soundIn 0
    in_delay = 80
    low_rt60 = 6
    mid_rt60 = 4
    eq1_freq = 190
    eq1_level = -6
    eq2_freq = 3500
    eq2_level = 6
    dry_wet_mix = 0
    level = 0
in X.zitaRev i i in_delay 200 low_rt60 mid_rt60 6000 eq1_freq eq1_level eq2_freq eq2_level dry_wet_mix level
