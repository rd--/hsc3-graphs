-- stkInst ; mesh2D ; event control ; https://ccrma.stanford.edu/software/stk/classstk_1_1Mesh2D.html
let f _ (g,x,y,z,o,rx,ry,p) =
      let kXDimension = 2
          kYDimension = 4
          kMeshDecay = 11
          kXYInputPosition = 1
          args = [kXDimension,latch x g * 127
                 ,kYDimension,latch y g * 127
                 ,kMeshDecay,(1 - z) * 127
                 ,kXYInputPosition,rx * 127]
          s = X.stkInst AR (midiCPS p) g (z * 2) 0 (X.stkAt "Mesh2D") (mce args)
      in pan2 s (o * 2 - 1) 1
in mix (rEventVoicer 16 f) * control KR "gain" 2
