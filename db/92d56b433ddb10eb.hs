-- tGrains ; demand UGens as inputs ; requires=buf
--         ; (Warning: empty sequence in Dseq - ServerId 'localhost' exited with exit code 0)
--         ; (also at sclang graph)
let b = control kr "buf" 0
    rt = mouseX kr 1 100 Exponential 0.2
    dId uid = dwhiteId uid 1 0.1 0.2
    zId u0 u1 u2 u3 u4 u5 u6 u7 = drandId u1 1 (mce [dgeomId u2 (diwhiteId u3 1 20 40) 0.1 (1 + dId u4)
                                                    ,dgeomId u5 (diwhiteId u6 1 20 40) 1 (1 - dId u7)])
    clk = impulse ar rt 0
    dsqId e xs = dseqId e dinf (mce xs)
    rate = dsqId 'α' [1,1,zId 'β' 'γ' 'δ' 'ε' 'ζ' 'η' 'θ' 'ι',0.5,0.5,0.2,0.1,0.1,0.1,0.1] * 2 + 1
    pos = dsqId 'κ' (Protect.uclone_seq (const False) 'λ' 8 (zId 'μ' 'ν' 'ξ' 'ο' 'π' 'ρ' 'σ' 'τ'))
    dur = dsqId 'υ' [1,dId 'φ',1,zId 'χ' 'ψ' 'ω' 'Α' 'Β' 'Γ' 'Δ' 'Ε',0.5,0.5,0.1,zId 'Ζ' 'Η' 'Θ' 'Ι' 'Κ' 'Λ' 'Μ' 'Ν'] * 2 / rt
    pan = dsqId 'Ξ' [1,1,1,0.5,0.2,0.1,0,0,0] * 2 - 1
    amp = dsqId 'Ο' [1,0,zId 'Π' 'Ρ' 'Σ' 'Τ' 'Υ' 'Φ' 'Χ' 'Ψ',0,2,1,1,0.1,0.1]
in tGrains 2 clk b rate pos dur pan amp 2
