-- neoFormant ; event control
let f (_,g,x,y,z,o,rx,_,_,_,_) =
      let carrierFreq = midiCps (x * 13 + 36)
          formantFreq = y `in_exprange` (100,550)
          phaseShift = lag rx 0.5 * 2
      in pan2 (X.neoFormant ar formantFreq carrierFreq phaseShift) (o * 2 - 1) (lagUD (z * g) 0 0.2)
in mix (eventVoicer 16 f) * control kr "gain" 0.2
