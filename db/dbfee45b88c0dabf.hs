-- ladspa ; caps ; # 1767 C* ChorusI - Mono chorus/flanger
let s = soundIn 0
    x = mouseX kr 0 1 Linear 0.2
    y = mouseY kr 0 1 Linear 0.2
    n1 = range 2.5 40 (lfNoise2Id 'α' kr 0.2)
    n2 = range 0.5 10 (lfNoise2Id 'β' kr 0.2)
in X.ladspa 1 ar 1767 [n1,n2,0.5,0.5,x,y,s]
