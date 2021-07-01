-- tremulate (jmcc) #1 ; event control
let f _ (g,x,y,z,o,rx,ry,_,_,_) =
      let s = fSinOsc ar ((x * 400 + 500) * mce [1,1.2,1.5,1.8]) 0
          r = X.rRandN 4 30 90
          a = max 0 (lfNoise2 kr (r * (0.75 + rx))) * z
          l = X.rRandN 4 (-1) 1
      in mix (pan2 s (l + (o * 2 - 1)) (a * lagUD g 0 (ry * 2)))
in combN (mix (eventVoicer 16 f) * control kr "gain" 0.5) 0.1 0.1 1
