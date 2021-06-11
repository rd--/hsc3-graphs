-- strummable silk (jmcc) #11
let mx = mousex 0 1 linear 0.2
    im = impulse 14 0
    str ix =
      let n = 15
          tr = abs (hpz1 (mx > (0.25 + ix * 0.07)))
          e = decay (im * lag (trig tr 1) 0.2 * 0.01) 0.04
          freq0 = midicps (([-2,0,3,5,7,10,12,15] !! ix) + 60)
          freq = map (* freq0) [1 .. n + 1]
          param = klankdata freq (replicate n 1) (listfill n (\_ -> rand 0.3 1))
      in pan2 (klank (pinknoise () * e) 1 0 1 param) (ix * 0.2 - 0.5) 1
    rallpass i = allpassn i 0.1 [rand 0 0.05,rand 0 0.05] 4
in iter 6 rallpass (leakdc (lpf (mixFill 8 str) 12000) 0.995)
