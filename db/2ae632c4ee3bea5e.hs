-- tremulate (jmcc) #1 ; event control
let f (_,w,x,_,z,o,rx,ry,_,_,_) =
      let s = fSinOsc ar ((x * 400 + 500) * mce [1,1.2,1.5,1.8]) 0
          r = X.randN 4 30 90
          a = max 0 (lfNoise2 kr (r * (0.75 + rx))) * z
          l = X.randN 4 (-1) 1
      in mix (pan2 s (l + (o * 2 - 1)) (a * lagUD w 0 (ry * 2)))
in combN (mix (voicer 16 f) * control kr "gain" 0.5) 0.1 0.1 1
