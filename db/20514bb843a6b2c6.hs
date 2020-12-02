-- tGrains ; demand UGens as inputs ; requires=buf
--         ; (Warning: empty sequence in Dseq - Server 'localhost' exited with exit code 0)
--         ; (also at sclang graph)
let b = control KR "buf" 0
    rt = mouseX KR 1 100 Exponential 0.2
    d uid = dwhite uid 1 0.1 0.2
    z u0 u1 u2 u3 u4 u5 u6 u7 = drand u1 1 (mce [dgeom u2 (diwhite u3 1 20 40) 0.1 (1 + d u4)
                                                ,dgeom u5 (diwhite u6 1 20 40) 1 (1 - d u7)])
    clk = impulse AR rt 0
    dsq e xs = dseq e dinf (mce xs)
    rate = dsq 'α' [1,1,z 'β' 'γ' 'δ' 'ε' 'ζ' 'η' 'θ' 'ι',0.5,0.5,0.2,0.1,0.1,0.1,0.1] * 2 + 1
    pos = dsq 'κ' (Protect.uclone_seq (const False) 'λ' 8 (z 'μ' 'ν' 'ξ' 'ο' 'π' 'ρ' 'σ' 'τ'))
    dur = dsq 'υ' [1,d 'φ',1,z 'χ' 'ψ' 'ω' 'Α' 'Β' 'Γ' 'Δ' 'Ε',0.5,0.5,0.1,z 'Ζ' 'Η' 'Θ' 'Ι' 'Κ' 'Λ' 'Μ' 'Ν'] * 2 / rt
    pan = dsq 'Ξ' [1,1,1,0.5,0.2,0.1,0,0,0] * 2 - 1
    amp = dsq 'Ο' [1,0,z 'Π' 'Ρ' 'Σ' 'Τ' 'Υ' 'Φ' 'Χ' 'Ψ',0,2,1,1,0.1,0.1]
in tGrains 2 clk b rate pos dur pan amp 2
