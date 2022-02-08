-- formant ; event control
let f (_,g,x,y,z,o,_,_,_,_,_) =
      let f0 = mce [200, 300, 400, 500] * x
          ff = linExp y 0 1 400 1200
      in splay (formant ar f0 ff 200) 1 (g * z) (o * 2 - 1) True
in mix (eventVoicer 16 f) * control kr "gain" 0.5
