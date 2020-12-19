-- ladspa ; caps ; # 2609 C* EqFA4p - 4-band parametric eq
let s = soundIn 0
    f z m l r = m (lfNoise2 z KR 0.2) (-1) 1 l r
    p = [f 'α' linLin 0 1
        ,f 'β' linExp 20 14000
        ,f 'γ' linExp 0.125 8
        ,f 'δ' linLin (-24) 24
        ,f 'ε' linLin 0 1
        ,f 'ζ' linExp 20 14000
        ,f 'η' linExp 0.125 8
        ,f 'θ' linLin (-24) 24
        ,f 'ι' linLin 0 1
        ,f 'κ' linExp 20 14000
        ,f 'λ' linExp 0.125 8
        ,f 'μ' linLin (-24) 24
        ,f 'ν' linLin 0 1
        ,f 'ξ' linExp 20 14000
        ,f 'ο' linExp 0.125 8
        ,f 'π' linLin (-24) 24
        ,0
        ,s]
in pan2 (X.ladspa 1 AR 2609 p) (f 'ρ' linLin (-1) 1) 0.25
