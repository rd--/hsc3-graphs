import Sound.SC3 {- hsc3 -}

sin_gliss :: UGen
sin_gliss =
  let t = 60
      ln (x0,x1) = xLine KR x0 x1 t DoNothing
      m = [(0.5,0.5),(0.5,1),(1,1.19),(1.19,1.56),(1.56,2),(2.51,2),(3.01,2.66),(4.1,3.01),(4.1,4.1)]
      a = mce [0.25,0.25,1,0.8,0.5,0.9,0.4,0.3,0.6,0.1,0.1]
      f = mce (map ln m)
  in mix (sinOsc AR (500 * f) 0 * 0.1 * a)
