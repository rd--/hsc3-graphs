-- modal space (jmcc) #8 ; local buffer
let ms n r =
      let b = aslocalbuf 1 [0,2,3.2,5,7,9,10] {- dorian scale -}
          x = mousex 0 15 linear 0.1 {- mouse indexes into scale -}
          k = degreetokey b x 12 {- 12 notes per octave -}
          o = sinosc (midicps (r + k + n * 0.04)) 0 * 0.1
          t = lfpulse (midicps [48, 55]) 0 0.15
          f = midicps (sinosc 0.1 0 * 10 + r)
          d = rlpf t f 0.1 * 0.1
          m = o + d
      in combn m 0.31 0.31 2 + m
in ms (lfnoise1 3) 48 + ms (lfnoise1 3) 72 * 0.25
