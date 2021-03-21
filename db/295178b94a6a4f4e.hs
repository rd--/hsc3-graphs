-- dwgSoundBoard
let sig = decay2 (dust 'α' AR 4) 0.01 1
    sb inp mul =
      let c1 = control_m KR "c1" 20.0 (1,40,"lin")
          c3 = control_m KR "c3" 20.0 (1,40,"lin")
          mix = control_m KR "mix" 0.8 (0,1,"lin")
          d1 = 199.0 * mul
          d2 = 211.0 * mul
          d3 = 223.0 * mul
          d4 = 227.0 * mul
          d5 = 229.0 * mul
          d6 = 233.0 * mul
          d7 = 239.0 * mul
          d8 = 241.0 * mul
      in X.dwgSoundBoard inp c1 c3 mix d1 d2 d3 d4 d5 d6 d7 d8
in sb sig (mce2 1 (control_m KR "mul" 2.8 (0.25,4,"lin")))
