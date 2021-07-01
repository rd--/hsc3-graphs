-- ay ; auto-pilot
let rate = mouseX kr 0.1 10 Linear 0.2
    rng l r i = linLin i (-1) 1 l r
    mk_ctlId e l r = rng l r (lfdNoise3Id e kr rate)
    mk_ctl_0Id e l r = rng l r (lfdNoise0Id e kr rate)
    tonea = mk_ctlId 'α' 10 3900
    toneb = mk_ctlId 'β' 10 3900
    tonec = mk_ctlId 'γ' 10 3900
    n = mk_ctlId 'δ' 0 31
    ctl = mk_ctl_0Id 'ε' 0 31
    vola = mk_ctlId 'ζ' 0 15
    volb = mk_ctlId 'η' 0 15
    volc = mk_ctlId 'θ' 0 15
    efreq = mk_ctlId 'ι' 0 4095
    estyle = mk_ctlId 'κ' 0 15
    s = X.ay ar tonea toneb tonec n ctl vola volb volc efreq estyle 0
in pan2 s 0 0.5
