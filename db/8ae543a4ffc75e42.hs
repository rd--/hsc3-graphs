-- blips 001 (jmcc) #SC3d1.5
let rand2U n = randU (-n) n
    blip_001 _ =
      let f = xLine KR (expRandU 0.25 400) (expRandU 0.25 400) 4 DoNothing
          nh = xLine KR (expRandU 2 100) (expRandU 2 100) 4 DoNothing
      in blip AR f nh
    blips_001 =
      let c = randU 0 1 `less_than` 0.8
          o = product [blip_001 (),blip_001 ()]
      in (c * pan2 o (line KR (rand2U 1) (rand2U 1) 4 DoNothing) 0.3)
    iter f n st = if n > 0 then iter f (n - 1) (f st) else st
    blips_001_pp =
      let f x = allpassN x 0.05 (mce2 (randU 0 0.05) (randU 0 0.05)) 4
      in iter f (6::Int) . distort
in blips_001_pp blips_001
