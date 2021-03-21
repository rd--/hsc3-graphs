-- ay ; auto-pilot
let rate = mouseX KR 0.1 10 Linear 0.2
    rng l r i = linLin i (-1) 1 l r
    mk_ctl e l r = rng l r (lfdNoise3 e KR rate)
    mk_ctl_0 e l r = rng l r (lfdNoise0 e KR rate)
    tonea = mk_ctl 'α' 10 3900
    toneb = mk_ctl 'β' 10 3900
    tonec = mk_ctl 'γ' 10 3900
    n = mk_ctl 'δ' 0 31
    ctl = mk_ctl_0 'ε' 0 31
    vola = mk_ctl 'ζ' 0 15
    volb = mk_ctl 'η' 0 15
    volc = mk_ctl 'θ' 0 15
    efreq = mk_ctl 'ι' 0 4095
    estyle = mk_ctl 'κ' 0 15
    s = X.ay AR tonea toneb tonec n ctl vola volb volc efreq estyle 0
in pan2 s 0 0.5
