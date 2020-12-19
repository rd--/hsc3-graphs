-- ladspa ; caps ; # 2592 C* AmpVTS - Idealised guitar amplification
let s = soundIn 0
    x = roundE (mouseX KR 0 8 Linear 0.2)
    y = mouseY KR 0 1 Linear 0.2
    enumN n e = take n (enumFrom e)
    [n1,n2,n3,n4,n5,n6,n7,n8] = map (\z -> lfNoise2 z KR 0.2) (enumN 8 'α')
in X.ladspa 1 AR 2592 [1,y,n1,n2,x,n3,n4,n5,n6,n7,n8,s]
