-- dbufrd ; demand rate single memory recurrence relation ; simple counter
let rec1 z k t f =
      let b = asLocalBuf z [k]
          r = dbufrd z b 0 Loop {- reader -}
          w = dbufwr z b 0 (f r) Loop {- writer -}
      in mrg2 (demand t 0 r) (demand t 0 w)
    f = rec1 'α' 0 (impulse KR 6 0) (\r -> (r + 1) `modE` 24)
in sinOsc AR (midiCPS (60 + f)) 0 * 0.1
