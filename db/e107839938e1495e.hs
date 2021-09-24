-- dbufrd ; demand rate single memory recurrence relation ; simple counter
let rec1Id z k t f =
      let b = asLocalBufId z [k]
          r = dbufrdId z b 0 Loop {- reader -}
          w = dbufwrId z b 0 (f r) Loop {- writer -}
      in mrg2 (demand t 0 r) (demand t 0 w)
    f = rec1Id 'α' 0 (impulse kr 6 0) (\r -> (r + 1) `modE` 24)
in sinOsc ar (midiCps (60 + f)) 0 * 0.1
