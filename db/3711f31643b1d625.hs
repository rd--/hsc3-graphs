-- laser bubble ; https://www.listarc.bham.ac.uk/lists/sc-users/msg14775.html ; id
let n = 8
    laser_bubble_f z =
      let xr = dxrandId z dinf (mce [0.1,0.2,0.3,0.4,0.5])
          lf = dstutterId z 2 xr
          du = duty ar lf 0 DoNothing lf
          tr = abs (hpz1 du) `greater_than` 0
          ph = sweep ar tr (1/du)
      in linExp ph 0 1 (randId z 50 100) (randId z 500 2000)
    f = mce (map laser_bubble_f (take n ['α'..]))
    [s0,s1] = mceChannels (splay (sinOsc ar f 0) 1 1 0 True)
in limiter (rotate2 s0 s1 (lfSaw kr 0.1 0)) 1 0.01 * 0.25
