-- ladspa ; caps ; # 2609 C* EqFA4p - 4-band parametric eq
let s = soundIn 0
    fId z m l r = m (lfNoise2Id z kr 0.2) (-1) 1 l r
    p = [fId 'α' linLin 0 1
        ,fId 'β' linExp 20 14000
        ,fId 'γ' linExp 0.125 8
        ,fId 'δ' linLin (-24) 24
        ,fId 'ε' linLin 0 1
        ,fId 'ζ' linExp 20 14000
        ,fId 'η' linExp 0.125 8
        ,fId 'θ' linLin (-24) 24
        ,fId 'ι' linLin 0 1
        ,fId 'κ' linExp 20 14000
        ,fId 'λ' linExp 0.125 8
        ,fId 'μ' linLin (-24) 24
        ,fId 'ν' linLin 0 1
        ,fId 'ξ' linExp 20 14000
        ,fId 'ο' linExp 0.125 8
        ,fId 'π' linLin (-24) 24
        ,0
        ,s]
in pan2 (X.ladspa 1 ar 2609 p) (fId 'ρ' linLin (-1) 1) 0.25
