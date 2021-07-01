-- zitaRev ; longer still
let i = soundIn 0
    k (nm,df,m) = control_m kr nm df m
    in_delay = k ("in_delay",100,(20,100,"lin"))
    low_rt60 = k ("low_rt60",6,(1,8,"exp"))
    mid_rt60 = k ("mid_rt60",2,(1,8,"exp"))
    eq1_freq = k ("eq1_freq",190,(40,2500,"exp"))
    eq1_level = k ("eq1_level",-6,(-15,15,"lin"))
    eq2_freq = k ("eq2_freq",3500,(160,10000,"exp"))
    eq2_level = k ("eq2_level",6,(-15,15,"lin"))
    dry_wet_mix = k ("dry_wet_mix",0.5,(0,1,"lin"))
    level = k ("level",-20,(-9,9,"lin"))
in X.zitaRev
   i i
   in_delay 200 low_rt60 mid_rt60 6000 eq1_freq eq1_level eq2_freq eq2_level dry_wet_mix level
