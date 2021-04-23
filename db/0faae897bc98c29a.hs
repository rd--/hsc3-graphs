-- MiBraids ; 21:VOSIM ; event control
let f _ (g,x,y,z,o,rx,_,_,_,_) =
      let md = X.miBraids_mode "VOSIM"
          mnn = x * 24 + 36 -- x * 12 + 78
      in pan2 (X.miBraids AR mnn (y * 0.75) rx md 0 0 0 0 0) (o * 2 - 1) (g * z)
in mix (rEventVoicer 16 f) * control KR "gain" 1
