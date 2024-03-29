-- tank (jmcc) ; http://create.ucsb.edu/pipermail/sc-users/2004-April/009692.html
let s1 _ =
      let d = dust ar 0.2
          f = expRand 300 2200
          p = rand (-1) 1
      in pan2 (decay2 d 0.1 0.5 * 0.1 * cubed (fSinOsc ar f 0)) p 1
    s2 =
      let d = dust ar 0.01
          n = brownNoise ar
      in pan2 (decay2 d 0.04 0.3 * n) 0 1
    rev_f i =
      let l0 = localIn 2 ar (mce2 0 0) * 0.98
          l1 = onePole l0 0.33
          (l1l,l1r) = unmce2 l1
          l2 = rotate2 l1l l1r 0.23
          l3 = allpassN l2 0.05 (X.randN 2 0.01 0.05) 2
          l4 = delayN l3 0.3 (mce2 0.17 0.23)
          l5 = allpassN l4 0.05 (X.randN 2 0.03 0.15) 2
          l6 = leakDC l5 0.995
          l7 = l6 + i
      in mrg [l7,localOut l7]
    r_allpass i = allpassN i 0.03 (X.randN 2 0.005 0.02) 1
    s3 = s2 + mixFill 8 s1
in rev_f (iter 4 r_allpass s3)
