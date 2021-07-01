-- ladspa ; caps ; # 1771 C* Saturate - Various static nonlinearities, 8x oversampled
let s = soundIn 0
in X.ladspa 1 ar 1771 [1,0,0,s]
