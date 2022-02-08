-- control inputs calculated as offsets per voice ; equivalent to above
let f i =
      let cc n = in' 1 kr (11000 + constant (i * 8 + n - 1))
          freq = midiCps (48 + cc 1 * 24)
          nh = cc 2 * 200
          pan = sinOsc kr (cc 3 * 2) 0 * cc 4
          amp = cc 5 + (sinOsc kr (cc 6) 0 * cc 7)
      in pan2 (blip ar freq nh) pan amp
in sum (map f [0 .. 15]) * control kr "gain" 0.1
