-- stkInst ; mandolin ; event control ; https://ccrma.stanford.edu/software/stk/classstk_1_1Mandolin.html
let f (_,g,_,y,z,o,rx,ry,p,_,_) =
      let kBodySize = 2
          kPluckPosition = 4
          kStringDetuning = 1
          args = [kBodySize,ry * 127
                 ,kPluckPosition,y * 127
                 ,kStringDetuning,rx * 127]
          s = X.stkInst ar (unitCps p * 1.5) g (z * 2) 0.5 (X.stkAt "Mandolin") (mce args)
      in pan2 s (o * 2 - 1) (lagUD g 0 5)
in mix (voicer 16 f) * control kr "gain" 2
