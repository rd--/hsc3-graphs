-- stkInst ; sitar ; event control ; https://ccrma.stanford.edu/software/stk/classstk_1_1Sitar.html
let f (_,g,_,y,z,o,_,_,p,_,_) =
      let args = [0] -- cannot be []...
          s = X.stkInst ar (unitCps (latch p g)) g (0.5 + z * 0.5) (y * 0.01) (X.stkAt "Sitar") (mce args)
      in pan2 s (o * 2 - 1) 1
in mix (voicer 16 f) * control kr "gain" 1
